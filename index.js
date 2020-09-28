var firebaseConfig = {
    apiKey: "AIzaSyARTnQaLRhCVI99lgdxLwm9HR-U3PsSJC0",
    authDomain: "inf551-project-17604.firebaseapp.com",
    databaseURL: "https://inf551-project-17604.firebaseio.com",
    projectId: "inf551-project-17604",
    storageBucket: "inf551-project-17604.appspot.com",
    messagingSenderId: "325793645100",
    appId: "1:325793645100:web:f50a9ac6b285e7f8dbc789"
  };
firebase.initializeApp(firebaseConfig);

var ref = firebase.database().ref();
var foreignkeyRelation = {"city":"CountryCode", "country":"Code", "countrylanguage":"CountryCode", "player_info":"Name display_name", "salary_info":"ID", "team_info":"Name ID id", "participant_info":"team id display_name"};


function createTableHead1(keys, tableName) {
    var table = '';
    var columnNames = keys;

    table += '<tr>';
        for (var i = 0; i < keys.length; i++) {
            table += '<th bgcolor="white">' + columnNames[i] + '</th>'
        }
    table += '</tr>';
    return table;
}

function createTableRow1(DB, currentTableName, row_dict) {
    var table = '';
    var val_array = Object.values(row_dict);
    var colLength = Object.keys(row_dict).length;

    table += '<tr>';
        for (var i = 0; i < colLength; i++) {
            table += '<td bgcolor="white" onclick="hyperlink(this, \''+ DB +'\', \''+ currentTableName +'\')">' + val_array[i] + '</td>';
        }
    table += '</tr>';
    return table;
}

function hyperlink(elmnt, DB, tablename) {
    var data_index = "";
    var Table1 = "";
    var api_request1 = "";
    var index1 = "";
    var TableHead = "";

    function tables(data_index, newtable) {
        var newtablename = newtable;
        console.log(data_index);
        var pk = Object.keys(data_index)[0];
        console.log(pk);
        var pkvalue = Object.values(data_index)[0];
        api_request1 = new Request('https://inf551-project-17604.firebaseio.com/'+DB+"/"+newtablename+".json" + "?orderBy="+'%22'+pk+'%22'+"&equalTo="+'%22'+pkvalue+"%22");
        fetch(api_request1)
          .then(res => res.json())
          .then((data) => {
                index1 = data; 
                if (Object.keys(index1).length == 1) {
                    var key = Object.keys(index1[Object.keys(index1)[0]]);
                    Table1 = createTableHead1(key, data_index["table"]);
                    var Table_row1 = createTableRow1(DB, newtablename, index1[Object.keys(index1)[0]]);
                    Table1 += Table_row1;
                    $('<table class="table table bordered" id="WorldCountry">'+Table1+'</table>').appendTo("#result");
                } else {
                    Table1 = "";
                    var key = Object.keys(index1[Object.keys(index1)[0]]);
                    Table1 = createTableHead1(key);
                    for (var x1 in index1) {  // travel the records
                        var Table_row1 = createTableRow1(DB, newtablename, index1[x1])
                        Table1 += Table_row1;
                    }
                    $('<table class="table table bordered" id="WorldCountry">'+Table1+'</table>').appendTo("#result");
                }
                
          });
        }

    var world_tables = {
        "city": ["country"],
        "country": ["city", "countrylanguage"],
        "countrylanguage": ["country"]
    }

    var fifa19_tables = {
        "player_info": ["team_info"],
        "salary_info": ["team_info"],
        "team_info": ["salary_info", "player_info"]
    }
    
    var acb_tables = {
        "participant_info":["team_info", "player_info"],
        "player_info": ["participant_info"],
        "team_info": ["participant_info"]
    }

    var elem = elmnt.textContent.toLowerCase();
    elem = elem.replace(/[().,=#-\/\\~]/g, "");
    var ref = firebase.database().ref();
    var di;
    var tn;
    ref.child(DB+"/"+DB+"_index/"+elem).on('value', function snapshot(data) {
        data_index = data.val();
        console.log(data_index);
        if (DB == 'world') {
            var Tnames = world_tables[tablename];
            for (var i = 0; i < Tnames.length; i++) {
                for (var j = 0; j < data_index.length; j++) {
                    if (data_index[j]['table'] == Tnames[i]) {
                        console.log("hello");
                        di = data_index[j];
                        tn = Tnames[i];
                    }
                }
                tables(di, tn);
            }
        }

        if (DB == 'fifa19') {
            var Tnames = fifa19_tables[tablename];
            console.log(Tnames);
            for (var i = 0; i < Tnames.length; i++) {
                console.log(Tnames[i]);
                for (var j = 0; j < data_index.length; j++) {
                    //console.log(data_index[j]);
                    if (data_index[j]['table'] == Tnames[i]) {
                        di = data_index[j];
                        tn = Tnames[i];
                        tables(di, tn);
                        //console.log("current table", tn);
                    }
                }
                //tables(di, tn);
            }
        }

        if (DB == 'acb') {
            var Tnames = acb_tables[tablename];
            for (var i = 0; i < Tnames.length; i++) {
                for (var j = 0; j < data_index.length; j++) {
                    if (data_index[j]['table'] == Tnames[i]) {
                        di = data_index[j];
                        tn = Tnames[i];
                    }
                }
                tables(di, tn);
            }
        }
    });

    elmnt.style.color = 'red';
}


$(document).ready(function(){
	var search_kw;
	var DB;
	var getfromfb;
	var dbtable = [];
	var pkname = [];
	var pkvalue = [];
	var pk;
	var pkv;
	var k;
	var count;
	var Table;
	var search_length;
	var record_already_table = [];
    var currentTableName1;


    var occurrence = function (array) {  // collect occurrences of the same key
        "use strict";
        var result = {};
        if (array instanceof Array) { // Check if input is array.
            array.forEach(function (v, i) {
                if (!result[v]) { // Initial object property creation.
                    result[v] = [i]; // Create an array for that property.
                } else { // Same occurrences found.
                    result[v].push(i); // Fill the array.
                }
            });
        }
        return result;
    };

    function createTableHead(keys, tableName) {
		var table = '';
		var columnNames = keys;

        table += '<tr>';
			for (var i = 0; i < keys.length; i++) {
			console.log(tableName)
			    if (foreignkeyRelation[tableName].includes(columnNames[i])) {  // check whether is foreign key
                    table += '<th bgcolor="yellow">' + columnNames[i] + '</th>'
                }
                else {
                    table += '<th bgcolor="white">' + columnNames[i] + '</th>'
                }
			}
		table += '</tr>';
		return table;
	}

	function createTableRow(row_dict) {
		var table = '';
		var val_array = Object.values(row_dict)
		var colLength = Object.keys(row_dict).length;

        table += '<tr>';
            for (var i = 0; i < colLength; i++) {
                table += '<td bgcolor="white" onclick="hyperlink(this, \''+ DB +'\', \''+ currentTableName1 +'\')">' + val_array[i] + '</td>';
                //table += '<td>' + val_array[i] + '</td>';
            }
        table += '</tr>';
		return table;
	}

	function getTable() {
		$("#result").empty();
		var distinctTableName = new Set(dbtable);  // get distinct table name of the keyword
		distinctTableName = Array.from(distinctTableName);  // convert type to array from set
		// get the number of rows in each table
		var row_num = occurrence(dbtable);
		for (var r in row_num) {
		    row_num[r] = row_num[r].length;
		}
		//console.log(distinctTableName)

		var pkvalue_occurrence = occurrence(pkvalue)  // get occurrences of each pkvalue and collect their indixes
        // sort pkvalue by occurrence frequency
        var keyValuePairs = []  // initialize
        for (var key in pkvalue_occurrence) {
          keyValuePairs.push([ key, pkvalue_occurrence[key].length ])
        }
        keyValuePairs.sort(function compare(kv1, kv2) {
          return kv2[1] - kv1[1]
        })
        //console.log(keyValuePairs);

        // show tuples in tables by order
        for (var t = 0; t < distinctTableName.length; t++) {

            var tablename_now = distinctTableName[t]
            ref.child(DB+"/"+distinctTableName[t]+"/0").on('value', function snapshot(data) {  // fetch the first raw to get column names
				var table_record_instance = data.val();
				var keys = Object.keys(table_record_instance);  // list of column names of the table
                var Table = createTableHead(keys, tablename_now);  // get column names into html table

                // get each row that belong to this table into the html table
                var duplicate_count = 0;
                for (var i = 0; i < keyValuePairs.length; i++) {  // travel the occurrences by frequency order
                    var exis_occ_freq = keyValuePairs[i];
                    var exis_index = pkvalue_occurrence[exis_occ_freq[0]];  // list of indexes in pkvalue of the existence
                    for (var j = 0; j < exis_index.length; j++) {
                        var exis_ix = exis_index[j];  // the original index in dbtable pkname pkvalue
                        if (dbtable[exis_ix] == distinctTableName[t]) {  // check if the row is in this table
                            var currentTableName = dbtable[exis_ix];
                            currentTableName1 = currentTableName;
                            var row_pkname = pkname[exis_ix];  // list of pkname of this row
                            var row_pkvalue = pkvalue[exis_ix];  // list of pkvalue of this row
                            var pk_ls_length = row_pkname.length;  // the number of pk in this table
                            // generate a val for indentifying
                            var temp = currentTableName;
                            for (var q = 0; q < pk_ls_length; q++) {
                                temp += row_pkname[q];
                                temp += row_pkvalue[q];
                            }

                            if ( ! record_already_table.includes(temp) ) {  // check if have put this record into table
                                // generate api
                                var api_request = new Request('https://inf551-project-17604.firebaseio.com/'+DB+"/"+distinctTableName[t]+".json" + "?orderBy="+'%22'+row_pkname[0]+'%22'+"&equalTo="+'%22'+row_pkvalue[0]+"%22");
                                fetch(api_request)
                                  .then(res => res.json())
                                  .then((data) => {
                                    req_result = data;
                                    if (Object.keys(req_result).length == 1) {  // only one result
                                        var row_occ = req_result[Object.keys(req_result)[0]];
                                        var Table_row = createTableRow(row_occ);
                                        Table += Table_row;
                                    }
                                    else if (Object.keys(req_result).length > 1) {  // pk consists of 2 columns in countrylanguage in world
                                        for (var x in req_result) {  // travel the records
                                            if (req_result[x][row_pkname[1]] == row_pkvalue[1]) {  // check the second pk
                                                var Table_row = createTableRow(req_result[x])
                                                Table += Table_row;
                                            }
                                        }
                                    }
                                    var count_row = (Table.match(/<tr>/g) || []).length-1;  // count how many rows we have in Table
                                    if (count_row + duplicate_count == row_num[currentTableName]) {  // only put record into table when we get all rows
                                        $('<table class="table table bordered" id="WorldCountry">'+Table+'</table>').appendTo("#result");  // put the results
                                    }

                                  });
                                record_already_table[record_already_table.length] = temp;  // mark this record already in table
                            }
                            else {
                                duplicate_count += 1;
                            }
                        }

                    }

                }

			});
        }

	} 

	function getfromFB(existenceIndex) {
		var index = existenceIndex;  // inverted index node

		var DBtable = [];
		var pk_name = [];
		var pk_value = [];


        for (var i = 0; i < index.length; i++) {
            var exis = index[i];
            DBtable[DBtable.length] = exis['table'];
            delete exis.table;
            pk_name[pk_name.length] = Object.keys(exis);
            pk_value[pk_value.length] = Object.values(exis);
        }

		return {
			dbtable: DBtable, //list of tables of each existence
			pkname: pk_name, //list of list of pk column name of each existence
			pkvalue: pk_value //list of list of pk value of each existence
		};
	}

	function gotData(data) {
		var existence_list = data.val();
		// get existence info
	    getfromfb = getfromFB(existence_list);
		dbtable = dbtable.concat(getfromfb.dbtable);
		pkname = pkname.concat(getfromfb.pkname);
		pkvalue = pkvalue.concat(getfromfb.pkvalue);

        if (count == search_length-1) {
            getTable();
        }

	}

	$("#submit").click(function(){
	    var rawsearch = $("#search_text").val()
	    // clean the search string
	    var cleanSearch = rawsearch.replace(/[().,=#-\/\\~]/g, "");
	    cleanSearch = cleanSearch.replace('[', "");
	    cleanSearch = cleanSearch.replace(']', "");

		var search = cleanSearch.split(" ");  // list of search keywords
		search_length = search.length;

        // initialization
        dbtable = [];
	    pkname = [];
	    pkvalue = [];

		for (var i = 0; i < search.length; i++) {
			search_kw = search[i];  // search keyword

			DB = $("#database").val()
			count = i;
			ref.child(DB+"/"+DB+"_index/"+search_kw).on('value', gotData);

		}

	});

});


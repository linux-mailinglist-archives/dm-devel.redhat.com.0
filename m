Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8007527BE78
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-KFyZ4N-8OMqLPWIiwYyMTw-1; Tue, 29 Sep 2020 03:55:31 -0400
X-MC-Unique: KFyZ4N-8OMqLPWIiwYyMTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8F0186DD2D;
	Tue, 29 Sep 2020 07:55:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 921A77E73E;
	Tue, 29 Sep 2020 07:55:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AB1D44A59;
	Tue, 29 Sep 2020 07:55:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08S3uP2c004543 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Sep 2020 23:56:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 984A64400D; Mon, 28 Sep 2020 03:56:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 940C84400C
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 03:56:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CAE58007D9
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 03:56:23 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-469-_QXq8yNYM6aCasZAHKwF-w-1;
	Sun, 27 Sep 2020 23:56:20 -0400
X-MC-Unique: _QXq8yNYM6aCasZAHKwF-w-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1F3FD20B7179;
	Sun, 27 Sep 2020 20:56:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1F3FD20B7179
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, pvorel@suse.cz
Date: Sun, 27 Sep 2020 20:56:04 -0700
Message-Id: <20200928035605.22701-2-tusharsu@linux.microsoft.com>
In-Reply-To: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
References: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
	dm-devel@redhat.com, ltp@lists.linux.it
Subject: [dm-devel] [PATCH v2 1/2] IMA: generalize key measurement tests
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

New functionality is being added in IMA to measure data provided by
kernel components. Tests have to be added in LTP to validate this new
feature. The functionality in ima_keys.sh can be reused to test this new
feature if it is made generic.

Refactor check_keys_policy() and test1() implemented in ima_keys.sh to
make it generic, and move the functionality to ima_setup.sh as new
functions - check_policy_pattern() and check_ima_ascii_log_for_policy().

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 .../security/integrity/ima/tests/ima_keys.sh  | 62 +++------------
 .../security/integrity/ima/tests/ima_setup.sh | 79 +++++++++++++++++++
 2 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index c9eef4b68..c2120358a 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -6,7 +6,7 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="cmp cut grep sed xxd"
+TST_NEEDS_CMDS="cmp cut grep xxd"
 TST_CNT=2
 TST_NEEDS_DEVICE=1
 TST_SETUP=setup
@@ -28,64 +28,28 @@ cleanup()
 	tst_is_num $KEYRING_ID && keyctl clear $KEYRING_ID
 }
 
-check_keys_policy()
-{
-	local pattern="$1"
-
-	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
-		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
-		return 1
-	fi
-	return 0
-}
-
 # Based on https://lkml.org/lkml/2019/12/13/564.
 # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
 test1()
 {
 	local keycheck_lines i keyrings templates
 	local pattern='keyrings=[^[:space:]]+'
-	local test_file="file.txt" tmp_file="file2.txt"
+	local policy="keyrings"
+	local tmp_file="$TST_TMPDIR/keycheck_tmp_file.txt"
+	local res
 
 	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
 
-	check_keys_policy "$pattern" > $tmp_file || return
-	keycheck_lines=$(cat $tmp_file)
-	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
-		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
-	if [ -z "$keyrings" ]; then
-		tst_res TCONF "IMA policy has a keyring key-value specifier, but no specified keyrings"
-		return
-	fi
-
-	templates=$(for i in $keycheck_lines; do echo "$i" | grep "template" | \
-		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
-
-	tst_res TINFO "keyrings: '$keyrings'"
-	tst_res TINFO "templates: '$templates'"
-
-	grep -E "($templates).*($keyrings)" $ASCII_MEASUREMENTS | while read line
-	do
-		local digest expected_digest algorithm
-
-		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
-		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
-		keyring=$(echo "$line" | cut -d' ' -f5)
+	check_policy_pattern "$pattern" $FUNC_KEYCHECK $TEMPLATE_BUF > $tmp_file || return
 
-		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
+	res="$(check_ima_ascii_log_for_policy $policy $tmp_file)"
 
-		if ! expected_digest="$(compute_digest $algorithm $test_file)"; then
-			tst_res TCONF "cannot compute digest for $algorithm"
-			return
-		fi
-
-		if [ "$digest" != "$expected_digest" ]; then
-			tst_res TFAIL "incorrect digest was found for $keyring keyring"
-			return
-		fi
-	done
+	if [ "$res" = "0" ]; then
+		tst_res TPASS "specified keyrings were measured correctly"
+	else
+		tst_res TFAIL "failed to measure specified keyrings"
+	fi
 
-	tst_res TPASS "specified keyrings were measured correctly"
 }
 
 # Create a new keyring, import a certificate into it, and verify
@@ -97,11 +61,11 @@ test2()
 	local cert_file="$TST_DATAROOT/x509_ima.der"
 	local keyring_name="key_import_test"
 	local pattern="keyrings=[^[:space:]]*$keyring_name"
-	local temp_file="file.txt"
+	local temp_file="$TST_TMPDIR/key_import_test_file.txt"
 
 	tst_res TINFO "verify measurement of certificate imported into a keyring"
 
-	check_keys_policy "$pattern" >/dev/null || return
+	check_policy_pattern "$pattern" $FUNC_KEYCHECK $TEMPLATE_BUF >/dev/null || return
 
 	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
 		tst_brk TBROK "unable to create a new keyring"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 1f17aa707..2841d7df5 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -54,6 +54,85 @@ compute_digest()
 	return 1
 }
 
+check_policy_pattern()
+{
+	local pattern="$1"
+	local func="$2"
+	local template="$3"
+
+	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
+		tst_res TCONF "IMA policy must specify $pattern, $func, $template"
+		return 1
+	fi
+	return 0
+}
+
+check_ima_ascii_log_for_policy()
+{
+	local test_file="$TST_TMPDIR/ascii_log_test_file.txt"
+	local grep_file="$TST_TMPDIR/ascii_log_grep_file.txt"
+	local func_lines sources templates i src 
+	local input_digest_res=1
+	local policy_option="$1"
+	local input_digest="$3"
+
+	func_lines=$(cat $2)
+
+	sources=$(for i in $func_lines; do echo "$i" | grep "$policy_option" | \
+		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
+	if [ -z "$sources" ]; then
+		tst_res TCONF "IMA policy $policy_option is a key-value specifier, but no values specified"
+		echo "1"
+		return
+	fi
+
+	templates=$(for i in $func_lines; do echo "$i" | grep "template" | \
+		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
+
+	tst_res TINFO "policy sources: '$sources'"
+	tst_res TINFO "templates: '$templates'"
+
+	grep -E "($templates).*($sources)" $ASCII_MEASUREMENTS > $grep_file
+
+	while read line
+	do
+		local digest expected_digest algorithm
+
+		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
+		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
+		src_line=$(echo "$line" | cut -d' ' -f5)
+
+		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
+
+		if ! expected_digest="$(compute_digest $algorithm $test_file)"; then
+			tst_res TCONF "cannot compute digest for $algorithm"
+			echo "1"
+			return
+		fi
+
+		if [ "$digest" != "$expected_digest" ]; then
+			tst_res TINFO "incorrect digest was found for $src_line $policy_option"
+			echo "1"	
+			return
+		fi
+
+		if [ "$input_digest" ]; then
+			if [ "$digest" = "$input_digest" ]; then
+				input_digest_res=0
+			fi
+		fi
+
+	done < $grep_file
+
+	if [ "$input_digest" ]; then
+		echo "$input_digest_res"
+		return
+	else
+		echo "0"
+		return
+	fi
+}
+
 check_policy_readable()
 {
 	if [ ! -f $IMA_POLICY ]; then
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


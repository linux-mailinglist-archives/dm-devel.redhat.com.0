Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 51E1B2574D2
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 09:58:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-Nk_ciz6VO2SE46BK8TYypA-1; Mon, 31 Aug 2020 03:57:24 -0400
X-MC-Unique: Nk_ciz6VO2SE46BK8TYypA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C7B1084C96;
	Mon, 31 Aug 2020 07:57:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2164487E2A;
	Mon, 31 Aug 2020 07:57:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D75DD85CD;
	Mon, 31 Aug 2020 07:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07T1Eifi009766 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Aug 2020 21:14:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 569F611921A5; Sat, 29 Aug 2020 01:14:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5243511921A3
	for <dm-devel@redhat.com>; Sat, 29 Aug 2020 01:14:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC78718AE947
	for <dm-devel@redhat.com>; Sat, 29 Aug 2020 01:14:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-318-Q9ZglfVgP-yyqclHvThJZw-1;
	Fri, 28 Aug 2020 21:14:36 -0400
X-MC-Unique: Q9ZglfVgP-yyqclHvThJZw-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 910DC20B7178;
	Fri, 28 Aug 2020 18:14:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 910DC20B7178
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, pvorel@suse.cz
Date: Fri, 28 Aug 2020 18:14:27 -0700
Message-Id: <20200829011427.12893-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 31 Aug 2020 03:56:57 -0400
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH] IMA: Add test for dm-crypt measurement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

IMA subsystem supports measuring data from other kernel components
through func=CRITICAL_DATA policy 'critical_kernel_data_sources'. 
This IMA policy can be set to measure the data coming from device-mapper
targets. This scenario needs test coverage.

Add a testcase which verifies that the IMA subsystem correctly measures
the data provided by one such DM target - dm-crypt.

This series needs a kernel built on the following repo/branch/patches:
 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity
 commit d012a7190fc1 ("Linux 5.9-rc2") 

And the following patch series should be applied in the order below:
 1. https://patchwork.kernel.org/patch/11709527/
 2. https://patchwork.kernel.org/patch/11742047/
 3. https://patchwork.kernel.org/patch/11743265/
 4. https://patchwork.kernel.org/patch/11743715/

The kernel code required for this series (the patches above)
is still under review. This series will be ready to merge in LTP only
after the above patches are merged.

This series is based on the following commit in LTP branch:
 commit a277498c08a7 ("IMA/ima_keys.sh: Enhance policy checks") 
        
Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 runtest/ima                                   |   1 +
 .../kernel/security/integrity/ima/README.md   |  20 +++
 .../integrity/ima/tests/ima_dm_crypt.sh       | 118 ++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

diff --git a/runtest/ima b/runtest/ima
index 5f4b4a7a1..123b6c8b0 100644
--- a/runtest/ima
+++ b/runtest/ima
@@ -5,4 +5,5 @@ ima_tpm ima_tpm.sh
 ima_violations ima_violations.sh
 ima_keys ima_keys.sh
 ima_kexec ima_kexec.sh
+ima_dm_crypt ima_dm_crypt.sh
 evm_overlay evm_overlay.sh
diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index 68d046678..663c0b624 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -37,6 +37,26 @@ see example in `kexec.policy`.
 The test attempts to kexec the existing running kernel image.
 To kexec a different kernel image export `IMA_KEXEC_IMAGE=<pathname>`.
 
+### IMA DM target (dm-crypt) measurement test
+
+To enable IMA to measure device-mapper target - dm-crypt,
+`ima_dm_crypt.sh` requires a readable IMA policy, as well as 
+a loaded measure policy with 
+`func=CRITICAL_DATA critical_kernel_data_sources=dm-crypt`
+
+As well as what's required for the IMA tests, dm-crypt measurement test require
+reading the IMA policy allowed in the kernel configuration:
+```
+CONFIG_IMA_READ_POLICY=y
+```
+
+The following kernel configuration is also required. It enables compiling
+the device-mapper target module dm-crypt, which allows to create a device
+that transparently encrypts the data on it.
+```
+CONFIG_DM_CRYPT
+```
+
 ## EVM tests
 
 `evm_overlay.sh` requires a builtin IMA appraise tcb policy (e.g. `ima_policy=appraise_tcb`
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
new file mode 100755
index 000000000..ee572ed01
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
@@ -0,0 +1,118 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Microsoft Corporation
+# Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
+#
+# Verify that DM target dm-crypt is measured correctly based on policy.
+
+TST_NEEDS_CMDS="grep cut sed tr dmsetup"
+TST_CNT=1
+TST_NEEDS_DEVICE=1
+TST_SETUP=setup
+
+. ima_setup.sh
+
+FUNC_CRIT_DATA='func=CRITICAL_DATA'
+TEMPLATE_BUF='template=ima-buf'
+REQUIRED_POLICY="^measure.*($FUNC_CRIT_DATA.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_CRIT_DATA)"
+
+setup()
+{
+	tst_res TINFO "inside setup"
+	require_ima_policy_content "$REQUIRED_POLICY" '-E' > policy.txt
+}
+
+check_dm_crypt_policy()
+{
+	local pattern="$1"
+
+	if ! grep -E "$pattern" policy.txt; then
+		tst_res TCONF "IMA policy must specify $pattern, $FUNC_CRIT_DATA, $TEMPLATE_BUF"
+		return 1
+	fi
+	return 0
+}
+
+test1()
+{
+	local dmcheck_lines i dm_targets templates
+	local policy="critical_kernel_data_sources"
+	local pattern='critical_kernel_data_sources=[^[:space:]]+'
+	local tmp_file="tmp.txt"
+	local tokens_file="tokens_file.txt" grep_file="grep_file.txt"
+	local arg cmd key tgt_name
+	local res=0
+
+	tst_res TINFO "verifying dm target - dmcrypt gets measured correctly."
+
+	check_dm_crypt_policy "$pattern" > $tmp_file || return
+
+	dmcheck_lines=$(cat $tmp_file)
+	dm_targets=$(for i in $dmcheck_lines; do echo "$i" | grep "$policy" | \
+		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
+	if [ -z "$dm_targets" ]; then
+		tst_res TCONF "IMA policy has a $policy key-value specifier, but no specified sources."
+		return
+	fi
+
+	templates=$(for i in $dmcheck_lines; do echo "$i" | grep "template" | \
+		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
+
+	tst_res TINFO "dm_targets: '$dm_targets'"
+	tst_res TINFO "templates: '$templates'"
+
+	tgt="crypt"
+	key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
+
+	arg="'0 1953125 crypt aes-xts-plain64 "
+	arg="$arg $key 0 "
+	arg="$arg /dev/loop0 0 1 allow_discards'"
+	tgt_name="test-crypt"
+	cmd="dmsetup create $tgt_name --table $arg"
+
+	tst_res TINFO "Executing: $cmd"
+	eval $cmd
+
+	grep -E "($templates)*($dm_targets)" $ASCII_MEASUREMENTS > $grep_file
+
+	while read line
+	do
+		local act_digest exp_digest comp_digest algorithm
+
+		act_digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
+		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
+		dmtgt_evtname=$(echo "$line" | cut -d' ' -f5)
+
+		echo "$line" | cut -d' ' -f6 | xxd -r -p > $tokens_file
+		plain_text=$(echo "$line" | cut -d' ' -f6 | xxd -r -p)
+
+		#expected digest for $cmd
+		exp_digest="039d8ff71918608d585adca3e5aab2e3f41f84d6"
+		comp_digest="$(compute_digest $algorithm $tokens_file)" || \
+			tst_brk TCONF "cannot compute digest for $algorithm"
+
+		if [ "$act_digest" != "$comp_digest" ]; then
+			tst_res TFAIL "Incorrect digest for ($dmtgt_evtname)."
+			tst_res TFAIL "Expected digest:($comp_digest)."
+			tst_res TFAIL "Actual digest:($act_digest)."
+			tst_res TINFO "Removing DM target $tgt_name."
+			dmsetup remove $tgt_name
+			return
+		fi
+
+		if [ "$act_digest" = "$exp_digest" ]; then
+			res=1
+		fi
+
+	done < $grep_file
+
+	if [ $res -eq 1 ]; then
+		tst_res TPASS "dm-crypt target verification passed."
+	else
+		tst_res TFAIL "dm-crypt target verification failed."
+	fi
+	tst_res TINFO "Removing DM target $tgt_name."
+	dmsetup remove $tgt_name
+}
+
+tst_run
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


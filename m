Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4BB25881B
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 08:24:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-9H531-ngNO2KhPncKWcIMQ-1; Tue, 01 Sep 2020 02:24:37 -0400
X-MC-Unique: 9H531-ngNO2KhPncKWcIMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC58A801AAC;
	Tue,  1 Sep 2020 06:24:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D1726335;
	Tue,  1 Sep 2020 06:24:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B3C479A31;
	Tue,  1 Sep 2020 06:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0816NmWg015493 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 02:23:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4606C110E998; Tue,  1 Sep 2020 06:23:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4121C110E99B
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:23:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30EE780029D
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:23:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-492-5XM_wQPaM9G3CQwl6nPGsQ-1;
	Tue, 01 Sep 2020 02:23:43 -0400
X-MC-Unique: 5XM_wQPaM9G3CQwl6nPGsQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5AEAEAC6F;
	Tue,  1 Sep 2020 06:07:42 +0000 (UTC)
Date: Tue, 1 Sep 2020 08:07:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <20200901060740.GA4117@dell5510>
References: <20200829011427.12893-1-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20200829011427.12893-1-tusharsu@linux.microsoft.com>
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
Cc: snitzer@redhat.com, zohar@linux.ibm.com, nramas@linux.microsoft.com,
	dm-devel@redhat.com, ltp@lists.linux.it,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] IMA: Add test for dm-crypt measurement
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Petr Vorel <pvorel@suse.cz>
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Tushar,

> IMA subsystem supports measuring data from other kernel components
> through func=CRITICAL_DATA policy 'critical_kernel_data_sources'. 
> This IMA policy can be set to measure the data coming from device-mapper
> targets. This scenario needs test coverage.
Thank you for your patch.

First, you haven't send this patch to LTP mailing list
(https://lists.linux.it/listinfo/ltp). I Cc it, please do next time.

> Add a testcase which verifies that the IMA subsystem correctly measures
> the data provided by one such DM target - dm-crypt.

> This series needs a kernel built on the following repo/branch/patches:
>  repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
>  branch: next-integrity
>  commit d012a7190fc1 ("Linux 5.9-rc2") 

> And the following patch series should be applied in the order below:
>  1. https://patchwork.kernel.org/patch/11709527/
>  2. https://patchwork.kernel.org/patch/11742047/
>  3. https://patchwork.kernel.org/patch/11743265/
>  4. https://patchwork.kernel.org/patch/11743715/

Thanks for a detailed info.

> The kernel code required for this series (the patches above)
> is still under review. This series will be ready to merge in LTP only
> after the above patches are merged.

> This series is based on the following commit in LTP branch:
>  commit a277498c08a7 ("IMA/ima_keys.sh: Enhance policy checks") 

> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> ---
>  runtest/ima                                   |   1 +
>  .../kernel/security/integrity/ima/README.md   |  20 +++
>  .../integrity/ima/tests/ima_dm_crypt.sh       | 118 ++++++++++++++++++
>  3 files changed, 139 insertions(+)
>  create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

> diff --git a/runtest/ima b/runtest/ima
> index 5f4b4a7a1..123b6c8b0 100644
> --- a/runtest/ima
> +++ b/runtest/ima
> @@ -5,4 +5,5 @@ ima_tpm ima_tpm.sh
>  ima_violations ima_violations.sh
>  ima_keys ima_keys.sh
>  ima_kexec ima_kexec.sh
> +ima_dm_crypt ima_dm_crypt.sh
>  evm_overlay evm_overlay.sh
> diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
> index 68d046678..663c0b624 100644
> --- a/testcases/kernel/security/integrity/ima/README.md
> +++ b/testcases/kernel/security/integrity/ima/README.md
> @@ -37,6 +37,26 @@ see example in `kexec.policy`.
>  The test attempts to kexec the existing running kernel image.
>  To kexec a different kernel image export `IMA_KEXEC_IMAGE=<pathname>`.

> +### IMA DM target (dm-crypt) measurement test
> +
> +To enable IMA to measure device-mapper target - dm-crypt,
> +`ima_dm_crypt.sh` requires a readable IMA policy, as well as 
> +a loaded measure policy with 
> +`func=CRITICAL_DATA critical_kernel_data_sources=dm-crypt`
Could you please also create ima_dm_crypt.policy file in
testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/ directory?

> +
> +As well as what's required for the IMA tests, dm-crypt measurement test require
> +reading the IMA policy allowed in the kernel configuration:
> +```
> +CONFIG_IMA_READ_POLICY=y
> +```
> +
> +The following kernel configuration is also required. It enables compiling
> +the device-mapper target module dm-crypt, which allows to create a device
> +that transparently encrypts the data on it.
> +```
> +CONFIG_DM_CRYPT
> +```
> +
>  ## EVM tests

>  `evm_overlay.sh` requires a builtin IMA appraise tcb policy (e.g. `ima_policy=appraise_tcb`
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
> new file mode 100755
> index 000000000..ee572ed01
> --- /dev/null
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
> @@ -0,0 +1,118 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Microsoft Corporation
> +# Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> +#
> +# Verify that DM target dm-crypt is measured correctly based on policy.
> +
> +TST_NEEDS_CMDS="grep cut sed tr dmsetup"
You don't use tr, and omit xxd (copy paste error).
+ nit: this could be sorted. Thus:
TST_NEEDS_CMDS="cut dmsetup grep sed xxd"

> +TST_CNT=1
> +TST_NEEDS_DEVICE=1
> +TST_SETUP=setup
> +
> +. ima_setup.sh
> +
> +FUNC_CRIT_DATA='func=CRITICAL_DATA'
> +TEMPLATE_BUF='template=ima-buf'
> +REQUIRED_POLICY="^measure.*($FUNC_CRIT_DATA.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_CRIT_DATA)"
> +
> +setup()
> +{
> +	tst_res TINFO "inside setup"
This is sort of debugging info. Please remove it.

> +	require_ima_policy_content "$REQUIRED_POLICY" '-E' > policy.txt
> +}
> +
> +check_dm_crypt_policy()
> +{
> +	local pattern="$1"
> +
> +	if ! grep -E "$pattern" policy.txt; then
> +		tst_res TCONF "IMA policy must specify $pattern, $FUNC_CRIT_DATA, $TEMPLATE_BUF"
> +		return 1
> +	fi
> +	return 0
> +}
setup() and check_dm_crypt_policy() are the same as check_keys_policy() in
ima_keys.sh. We could move $REQUIRED_POLICY handling into ima_setup() in
ima_setup.sh. And check_{dm_crypt,keys}_policy() could be also moved to
ima_setup.sh as check_test_policy().

NOTE, you need to use $TST_TMPDIR/policy.txt instead of policy.txt: see:
https://patchwork.ozlabs.org/project/ltp/patch/20200831155953.10899-1-pvorel@suse.cz/
(I'm going to merge this one today) to fix problems on /tmp on tmpfs.
(or simply just add temporary for testing TST_NEEDS_DEVICE=1 to the end of
ima_setup.sh).

> +
> +test1()
> +{
> +	local dmcheck_lines i dm_targets templates
> +	local policy="critical_kernel_data_sources"
> +	local pattern='critical_kernel_data_sources=[^[:space:]]+'
> +	local tmp_file="tmp.txt"
> +	local tokens_file="tokens_file.txt" grep_file="grep_file.txt"
> +	local arg cmd key tgt_name
> +	local res=0
nit: local res
Later you can check
if [ "$res" = 1 ]; then

> +
> +	tst_res TINFO "verifying dm target - dmcrypt gets measured correctly."
> +
> +	check_dm_crypt_policy "$pattern" > $tmp_file || return
> +
> +	dmcheck_lines=$(cat $tmp_file)
> +	dm_targets=$(for i in $dmcheck_lines; do echo "$i" | grep "$policy" | \
> +		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
Again, copy paste from ima_keys.sh. Could this be generalized and moved to
ima_setup.sh? See my hint below.

> +	if [ -z "$dm_targets" ]; then
> +		tst_res TCONF "IMA policy has a $policy key-value specifier, but no specified sources."
> +		return
> +	fi
> +
> +	templates=$(for i in $dmcheck_lines; do echo "$i" | grep "template" | \
> +		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')
> +
> +	tst_res TINFO "dm_targets: '$dm_targets'"
> +	tst_res TINFO "templates: '$templates'"
> +
> +	tgt="crypt"
> +	key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
> +
> +	arg="'0 1953125 crypt aes-xts-plain64 "
> +	arg="$arg $key 0 "
> +	arg="$arg /dev/loop0 0 1 allow_discards'"
> +	tgt_name="test-crypt"
> +	cmd="dmsetup create $tgt_name --table $arg"
> +
> +	tst_res TINFO "Executing: $cmd"
> +	eval $cmd
Please no eval and TINFO. We have ROD() for this:

	ROD dmsetup create $tgt_name --table $arg"

which also prints error if failed.

> +
> +	grep -E "($templates)*($dm_targets)" $ASCII_MEASUREMENTS > $grep_file
> +
> +	while read line
> +	do
> +		local act_digest exp_digest comp_digest algorithm
> +
> +		act_digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
> +		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
> +		dmtgt_evtname=$(echo "$line" | cut -d' ' -f5)
Again, whole block is very similar to one from ima_keys.sh. Could this be
generalized? 

Maybe this function would have callback for verification function?

loop_measurements()
{
	local pattern="$1"
	local target="$2"
	local ver_func="$3"
	shift 3
	local lines line targets

    check_keys_policy "$pattern" > tmp || return
	lines=$(cat tmp)
	targets=$(for i in $lines; do echo "$i" | grep "$target" | \
		sed "s/\./\\\./g" | cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')

	if [ -z "$targets" ]; then
		tst_res TCONF "IMA policy has a $target key-value specifier, but no specified sources."
		return
	fi

	templates=$(for i in $lines; do echo "$i" | grep "template" | \
 		cut -d'=' -f2; done | sed ':a;N;$!ba;s/\n/|/g')

	...

	grep -E "($templates).*($targets)" $ASCII_MEASUREMENTS | while read line
	do
	...
	$ver_func $@
	done
}

BTW I plan to send v2 for ima_tpm.sh patch
https://patchwork.ozlabs.org/project/ltp/patch/20200527071434.28574-1-pvorel@suse.cz/
Maybe this could use it somehow as well, but not required. Main reason was to
use $DIGEST_INDEX (default 4), which would help to use tests also on ima_template_fmt.
In the future, when reboot requirement is added into LTP API this could be used
to tests more setup. But you can ignore it now.

> +
> +		echo "$line" | cut -d' ' -f6 | xxd -r -p > $tokens_file
> +		plain_text=$(echo "$line" | cut -d' ' -f6 | xxd -r -p)
> +
> +		#expected digest for $cmd
This is obvious, please remove it.

> +		exp_digest="039d8ff71918608d585adca3e5aab2e3f41f84d6"
> +		comp_digest="$(compute_digest $algorithm $tokens_file)" || \
> +			tst_brk TCONF "cannot compute digest for $algorithm"
> +
> +		if [ "$act_digest" != "$comp_digest" ]; then
> +			tst_res TFAIL "Incorrect digest for ($dmtgt_evtname)."
> +			tst_res TFAIL "Expected digest:($comp_digest)."
> +			tst_res TFAIL "Actual digest:($act_digest)."
This is wrong. There should be only single tst_res TFAIL message (errors are
counted, thus there would be 3 failures instead of one. Use
			tst_res TFAIL "Incorrect digest for ($dmtgt_evtname): '$act_digest' (expected: '$comp_digest')"

(keep it on single line to help grep the message.)
nit: we usually don't put dot at the end of the sentence. And use lower case
messages. And you're not consistent (you use both approaches).

> +			tst_res TINFO "Removing DM target $tgt_name."
> +			dmsetup remove $tgt_name
> +			return
> +		fi
> +
> +		if [ "$act_digest" = "$exp_digest" ]; then
> +			res=1
Maybe also TFAIL and return here instead of using $res?

> +		fi
> +
> +	done < $grep_file
> +
> +	if [ $res -eq 1 ]; then
if [ "$res" = 1 ]; then
> +		tst_res TPASS "dm-crypt target verification passed."
> +	else
> +		tst_res TFAIL "dm-crypt target verification failed."
> +	fi
> +	tst_res TINFO "Removing DM target $tgt_name."
> +	dmsetup remove $tgt_name
Duplicity. Please, put it into cleanup function.

> +}
> +
> +tst_run

Kind regards,
Petr

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


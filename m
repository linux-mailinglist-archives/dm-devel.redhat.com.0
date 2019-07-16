Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 281966B902
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 11:15:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D388223873;
	Wed, 17 Jul 2019 09:15:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E7C608A6;
	Wed, 17 Jul 2019 09:15:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48A631800202;
	Wed, 17 Jul 2019 09:15:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GI8ps9017224 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 14:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F7894F670; Tue, 16 Jul 2019 18:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25D31D6;
	Tue, 16 Jul 2019 18:08:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 64C4330B9BF5;
	Tue, 16 Jul 2019 18:08:45 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id EE9A620B7185; Tue, 16 Jul 2019 11:08:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id CFA0830114FD;
	Tue, 16 Jul 2019 11:08:44 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:08:44 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <395efa90-65d8-d832-3e2b-2b8ee3794688@gmail.com>
Message-ID: <alpine.LRH.2.21.1907161035490.121213@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190701181958.6493-1-jaskarankhurana@linux.microsoft.com>
	<MN2PR21MB12008A962D4DD8662B3614508AF20@MN2PR21MB1200.namprd21.prod.outlook.com>
	<alpine.LRH.2.21.1907121025510.66082@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
	<395efa90-65d8-d832-3e2b-2b8ee3794688@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 18:08:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 18:08:45 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 05:14:39 -0400
Cc: Scott Shell <SCOTTSH@microsoft.com>, dm-devel@redhat.com,
	snitzer@redhat.com, ebiggers@google.com,
	Nazmus Sakib <mdsakib@microsoft.com>,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v6 0/1] Add dm verity root hash pkcs7 sig
 validation.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 17 Jul 2019 09:15:25 +0000 (UTC)


Hello Milan,
On Tue, 16 Jul 2019, Milan Broz wrote:

> On 12/07/2019 19:33, Jaskaran Singh Khurana wrote:
>>
>> Hello Milan,
>>
>>> Changes in v6:
>>>
>>> Address comments from Milan Broz and Eric Biggers on v5.
>>>
>>> -Keep the verification code under config DM_VERITY_VERIFY_ROOTHASH_SIG.
>>>
>>> -Change the command line parameter to requires_signatures(bool) which will
>>> force root hash to be signed and trusted if specified.
>>>
>>> -Fix the signature not being present in verity_status. Merged the
>>> https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fmbroz%2Flinux.git%2Fcommit%2F%3Fh%3Ddm-cryptsetup%26id%3Da26c10806f5257e255b6a436713127e762935ad3&amp;data=02%7C01%7CJaskaran.Khurana%40microsoft.com%7C18f92445e46940aeebb008d6fe50c610%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636976020210890638&amp;sdata=aY0V9%2FBz2RHryIvoftGKUGnyPp9Fsc1JY4FZbHfW4hg%3D&amp;reserved=0
>>> made by Milan Broz and tested it.
>>>
>>>
>>
>> Could you please provide feedback on this v6 version.
>
> Hi,
>
> I am ok with the v6 patch; I think Mike will return to it in 5.4 reviews.
>

Thanks for the help and also for reviewing this patch. Could you please 
add Reviewed-by/Tested-by tag to the patch.

> But the documentation is very brief. I spent quite a long time to configure the system properly.
> I think you should add more description (at least to patch header) how to use this feature in combination with system keyring.
>

I will add more documentation to the patch header describing the steps 
required for setup.

> Do I understand correctly that these steps need to be done?
>
> - user configures a certificate and adds it in kernel builtin keyring (I used CONFIG_SYSTEM_TRUSTED_KEYS option).
> - the dm-verity device root hash is signed directly by a key of this cert
> - the signature is uploaded to the user keyring
> - reference to signature in keyring is added as an optional dm-verity table parameter root_hash_sig_key_desc
> - optionally, require_signatures dm-verity module is set to enforce signatures.
>
> For reference, below is the bash script I used (with unpatched veritysetup to generate working DM table), is the expected workflow here?

The steps and workflow is correct. I will send the cryptsetup changes for 
review.

>
> #!/bin/bash
>
> NAME=test
> DEV=/dev/sdc
> DEV_HASH=/dev/sdd
> ROOT_HASH=778fccab393842688c9af89cfd0c5cde69377cbe21ed439109ec856f2aa8a423
> SIGN=sign.txt
> SIGN_NAME=verity:$NAME
>
> # get unsigned device-mapper table using unpatched veritysetup
> veritysetup open $DEV $NAME $DEV_HASH $ROOT_HASH
> TABLE=$(dmsetup table $NAME)
> veritysetup close $NAME
>
> # Generate self-signed CA key, must be in .config as CONFIG_SYSTEM_TRUSTED_KEYS="path/ca.pem"
> #openssl req -x509 -newkey rsa:1024 -keyout ca_key.pem -out ca.pem -nodes -days 365 -set_serial 01 -subj /CN=example.com
>
> # sign root hash directly by CA cert
> echo -n $ROOT_HASH | openssl smime -sign -nocerts -noattr -binary -inkey ca_key.pem -signer ca.pem -outform der -out $SIGN
>
> # load signature to keyring
> keyctl padd user $SIGN_NAME @u <$SIGN
>
> # add device-mapper table, now with sighed root hash optional argument
> dmsetup create -r $NAME --table "$TABLE 2 root_hash_sig_key_desc $SIGN_NAME"
> dmsetup table $NAME
>
> # cleanup
> dmsetup remove $NAME
> keyctl clear @u
>
>

Thanks for testing the changes and all the guidance here.

> Milan
>
Regards,
Jaskaran.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

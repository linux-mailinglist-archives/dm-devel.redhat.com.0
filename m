Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C91596EF
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 11:10:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A831C057F4B;
	Fri, 28 Jun 2019 09:10:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD2B7608CD;
	Fri, 28 Jun 2019 09:10:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 858701806B15;
	Fri, 28 Jun 2019 09:10:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S22KQ0005159 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 22:02:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EB875D784; Fri, 28 Jun 2019 02:02:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C89DC5D71D;
	Fri, 28 Jun 2019 02:02:15 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id B8F15308FBB4;
	Fri, 28 Jun 2019 02:02:14 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id F37CB20B719F; Thu, 27 Jun 2019 18:52:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id EAF7C30056D6;
	Thu, 27 Jun 2019 18:52:02 -0700 (PDT)
Date: Thu, 27 Jun 2019 18:52:02 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <568f2532-e46b-5ac7-4fc5-c96983702f2d@gmail.com>
Message-ID: <alpine.LRH.2.21.1906271850280.22562@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
	<568f2532-e46b-5ac7-4fc5-c96983702f2d@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 28 Jun 2019 02:02:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 28 Jun 2019 02:02:15 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 28 Jun 2019 05:09:36 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	ebiggers@google.com, linux-kernel@vger.kernel.org,
	jmorris@namei.org, linux-security-module@vger.kernel.org,
	mpatocka@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-integrity@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 28 Jun 2019 09:10:30 +0000 (UTC)



On Thu, 27 Jun 2019, Milan Broz wrote:

> Hi,
>
> I tried to test test the patch, two comments below.
>
> On 19/06/2019 21:10, Jaskaran Khurana wrote:
>> The verification is to support cases where the roothash is not secured by
>> Trusted Boot, UEFI Secureboot or similar technologies.
>> One of the use cases for this is for dm-verity volumes mounted after boot,
>> the root hash provided during the creation of the dm-verity volume has to
>> be secure and thus in-kernel validation implemented here will be used
>> before we trust the root hash and allow the block device to be created.
>>
>> The signature being provided for verification must verify the root hash and
>> must be trusted by the builtin keyring for verification to succeed.
>>
>> The hash is added as a key of type "user" and the description is passed to
>> the kernel so it can look it up and use it for verification.
>>
>> Kernel commandline parameter will indicate whether to check (only if
>> specified) or force (for all dm verity volumes) roothash signature
>> verification.
>>
>> Kernel commandline: dm_verity.verify_sig=1 or 2 for check/force root hash
>> signature validation respectively.
>
> 1) I think the switch should be just boolean - enforce signatures for all dm-verity targets
> (with default to false/off).
>
> The rest should be handled by simple logic - if the root_hash_sig_key_desc option
> is specified, the signature MUST be validated in the constructor, all errors should cause
> failure (bad reference in keyring, bad signature, etc).
>
> (Now it ignores for example bad reference to the keyring, this is quite misleading.)
>
> If a user wants to activate a dm-verity device without a signature, just remove
> optional argument referencing the signature.
> (This is not possible with dm_verity.verify_sig set to true/on.)
>
>
> 2) All DM targets must provide the same mapping table status ("dmsetup table"
> command) as initially configured.
> The output of the command should be directly usable as mapping table constructor.
>
> Your patch is missing that part, I tried to fix it, add-on patch is here
> https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git/commit/?h=dm-cryptsetup&id=a26c10806f5257e255b6a436713127e762935ad3
> (feel free to fold it in your patch)
>
>
> Thanks,
> Milan
>
Hello Milan,

Thanks for testing and reviewing this. I will take care of the above 
comments change it to a boolean and for the second point merge the add-on 
patch that you shared.

Regards,
Jaskaran

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

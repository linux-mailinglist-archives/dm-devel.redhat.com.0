Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 971055970A
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 11:13:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20FB730BB37D;
	Fri, 28 Jun 2019 09:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD70027194;
	Fri, 28 Jun 2019 09:13:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D9DE206D2;
	Fri, 28 Jun 2019 09:13:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S1vQES030254 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 21:57:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF7385D9E2; Fri, 28 Jun 2019 01:57:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB145D9D2;
	Fri, 28 Jun 2019 01:57:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 9F7C7308339F;
	Fri, 28 Jun 2019 01:57:19 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 4A66B20B7194; Thu, 27 Jun 2019 18:49:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 2D89630056D6;
	Thu, 27 Jun 2019 18:49:58 -0700 (PDT)
Date: Thu, 27 Jun 2019 18:49:58 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20190627234149.GA212823@gmail.com>
Message-ID: <alpine.LRH.2.21.1906271844470.22562@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
	<20190627234149.GA212823@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 28 Jun 2019 01:57:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 28 Jun 2019 01:57:19 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 28 Jun 2019 05:09:36 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	gmazyland@gmail.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 28 Jun 2019 09:13:09 +0000 (UTC)



On Thu, 27 Jun 2019, Eric Biggers wrote:

> Hi Jaskaran, one comment (I haven't reviewed this in detail):
>
> On Wed, Jun 19, 2019 at 12:10:48PM -0700, Jaskaran Khurana wrote:
>> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
>> index db269a348b20..2d658a3512cb 100644
>> --- a/drivers/md/Kconfig
>> +++ b/drivers/md/Kconfig
>> @@ -475,6 +475,7 @@ config DM_VERITY
>>  	select CRYPTO
>>  	select CRYPTO_HASH
>>  	select DM_BUFIO
>> +	select SYSTEM_DATA_VERIFICATION
>>  	---help---
>>  	  This device-mapper target creates a read-only device that
>>  	  transparently validates the data on one underlying device against
>> diff --git a/drivers/md/Makefile b/drivers/md/Makefile
>> index be7a6eb92abc..3b47b256b15e 100644
>> --- a/drivers/md/Makefile
>> +++ b/drivers/md/Makefile
>> @@ -18,7 +18,7 @@ dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
>>  		    dm-cache-background-tracker.o
>>  dm-cache-smq-y   += dm-cache-policy-smq.o
>>  dm-era-y	+= dm-era-target.o
>> -dm-verity-y	+= dm-verity-target.o
>> +dm-verity-y	+= dm-verity-target.o dm-verity-verify-sig.o
>>  md-mod-y	+= md.o md-bitmap.o
>>  raid456-y	+= raid5.o raid5-cache.o raid5-ppl.o
>>  dm-zoned-y	+= dm-zoned-target.o dm-zoned-metadata.o dm-zoned-reclaim.o
>
> Perhaps this should be made optional and controlled by a kconfig option
> CONFIG_DM_VERITY_SIGNATURE_VERIFICATION, similar to CONFIG_DM_VERITY_FEC?
>
> CONFIG_SYSTEM_DATA_VERIFICATION brings in a lot of stuff, which might be
> unnecessary for some dm-verity users.  Also, you've already separated most of
> the code out into a separate .c file anyway.
>
> - Eric
>
Hello Eric,

This started with a config (see V4). We didnot want scripts that pass this 
parameter to suddenly stop working if for some reason the 
verification is turned off so the optional parameter was just 
parsed and no validation happened if the CONFIG was turned off. This was 
changed to a commandline parameter after feedback from the community, so I would prefer 
to keep it *now* as commandline parameter. Let me know if you are OK with 
this.

Regards,
JK

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

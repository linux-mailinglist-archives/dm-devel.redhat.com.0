Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665C5B67D
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 10:13:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 785E3C1EB1FF;
	Mon,  1 Jul 2019 08:13:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6ACA5D71C;
	Mon,  1 Jul 2019 08:13:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 013D5206D1;
	Mon,  1 Jul 2019 08:12:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SH4p75017281 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 13:04:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDB761001B29; Fri, 28 Jun 2019 17:04:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3DB11001B17;
	Fri, 28 Jun 2019 17:04:47 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 6A4EA308213C;
	Fri, 28 Jun 2019 17:03:21 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id DA9F320BE446; Fri, 28 Jun 2019 10:03:15 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 856A53010329;
	Fri, 28 Jun 2019 10:03:15 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:03:15 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <264565b3-ff3c-29c0-7df0-d8ff061087d3@gmail.com>
Message-ID: <alpine.LRH.2.21.1906281001020.119795@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
	<20190627234149.GA212823@gmail.com>
	<alpine.LRH.2.21.1906271844470.22562@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
	<20190628030017.GA673@sol.localdomain>
	<264565b3-ff3c-29c0-7df0-d8ff061087d3@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 28 Jun 2019 17:04:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 28 Jun 2019 17:04:24 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jul 2019 04:11:25 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	Eric Biggers <ebiggers@kernel.org>,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 01 Jul 2019 08:13:44 +0000 (UTC)


Hello Eric/Milan,

On Fri, 28 Jun 2019, Milan Broz wrote:

> On 28/06/2019 05:00, Eric Biggers wrote:
>>> Hello Eric,
>>>
>>> This started with a config (see V4). We didnot want scripts that pass this
>>> parameter to suddenly stop working if for some reason the verification is
>>> turned off so the optional parameter was just parsed and no validation
>>> happened if the CONFIG was turned off. This was changed to a commandline
>>> parameter after feedback from the community, so I would prefer to keep it
>>> *now* as commandline parameter. Let me know if you are OK with this.
>>>
>>> Regards,
>>> JK
>>
>> Sorry, I haven't been following the whole discussion.  (BTW, you sent out
>> multiple versions both called "v4", and using a cover letter for a single patch
>> makes it unnecessarily difficult to review.)  However, it appears Milan were
>> complaining about the DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE option which set the
>> policy for signature verification, *not* the DM_VERITY_VERIFY_ROOTHASH_SIG
>> option which enabled support for signature verification.  Am I missing
>> something?  You can have a module parameter which controls the "signatures
>> required" setting, while also allowing people to compile out kernel support for
>> the signature verification feature.
>
> Yes, this was exactly my point.
>
> I think I even mention in some reply to use exactly the same config Makefile logic
> as for FEC - to allow completely compile it out of the source:
>
> ifeq ($(CONFIG_DM_VERITY_FEC),y)
> dm-verity-objs                  += dm-verity-fec.o
> endif
>
>> Sure, it means that the signature verification support won't be guaranteed to be
>> present when dm-verity is.  But the same is true of the hash algorithm (e.g.
>> sha512), and of the forward error correction feature.  Since the signature
>> verification is nontrivial and pulls in a lot of other kernel code which might
>> not be otherwise needed (via SYSTEM_DATA_VERIFICATION), it seems a natural
>> candidate for putting the support behind a Kconfig option.
>
> On the other side, dm-verity is meant for a system verification, so if it depends
> on SYSTEM_DATA_VERIFICATION is ... not so surprising :)
>
> But the change above is quite easy and while we already have FEC as config option,
> perhaps let's do it the same here.
>
> Milan
>
Yes, I will make this change. Please consider this discussion as resolved. 
Thanks.

Regards,
Jaskaran.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

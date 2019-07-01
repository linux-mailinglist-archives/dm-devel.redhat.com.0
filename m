Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A505F5C9F8
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 09:32:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E802630C252E;
	Tue,  2 Jul 2019 07:31:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39FF85C296;
	Tue,  2 Jul 2019 07:30:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 741831806B12;
	Tue,  2 Jul 2019 07:30:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x61HZ1s6022589 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 13:35:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE9ED9069; Mon,  1 Jul 2019 17:35:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D1094272;
	Mon,  1 Jul 2019 17:34:57 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id BE9B081DF1;
	Mon,  1 Jul 2019 17:33:08 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 2FEB720BCFC5; Mon,  1 Jul 2019 10:33:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 2922E3011494;
	Mon,  1 Jul 2019 10:33:00 -0700 (PDT)
Date: Mon, 1 Jul 2019 10:33:00 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <749ddf56-3cb6-42c8-9ccc-71e09558400f@gmail.com>
Message-ID: <alpine.LRH.2.21.1907011029100.31396@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
	<alpine.LRH.2.21.1906282040490.15624@namei.org>
	<749ddf56-3cb6-42c8-9ccc-71e09558400f@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 01 Jul 2019 17:34:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 01 Jul 2019 17:34:26 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 02 Jul 2019 03:29:26 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 0/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 07:32:03 +0000 (UTC)


Hello Milan,
On Mon, 1 Jul 2019, Milan Broz wrote:

> On 29/06/2019 06:01, James Morris wrote:
>> On Thu, 27 Jun 2019, Eric Biggers wrote:
>>
>>> I don't understand your justification for this feature.
>>>
>>> If userspace has already been pwned severely enough for the attacker to be
>>> executing arbitrary code with CAP_SYS_ADMIN (which is what the device mapper
>>> ioctls need), what good are restrictions on loading more binaries from disk?
>>>
>>> Please explain your security model.
>>
>> Let's say the system has a policy where all code must be signed with a
>> valid key, and that one mechanism for enforcing this is via signed
>> dm-verity volumes. Validating the signature within the kernel provides
>> stronger assurance than userspace validation. The kernel validates and
>> executes the code, using kernel-resident keys, and does not need to rely
>> on validation which has occurred across a trust boundary.
>
> Yes, but as it is implemented in this patch, a certificate is provided as
> a binary blob by the (super)user that activates the dm-verity device.
>
> Actually, I can put there anything that looks like a correct signature (self-signed
> or so), and dm-verity code is happy because the root hash is now signed.
>
> Maybe could this concept be extended to support in-kernel compiled certificates?
>
> I like the idea of signed root hash, but the truth is that if you have access
> to device activation, it brings nothing, you can just put any cert in the keyring
> and use it.
>
> Milan
>

The signature needs to be trusted by the .builtin_trusted_keys which is
a read-only list of keys that were compiled into the kernel. The 
verify_pkcs7_signature verifies trust against the builtin keyring so I 
think what you are suggesting is covered here.

Regards,
Jaskaran.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

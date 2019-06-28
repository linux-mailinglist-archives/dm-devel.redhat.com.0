Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E75B680
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 10:13:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6405881DE6;
	Mon,  1 Jul 2019 08:13:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE831001B29;
	Mon,  1 Jul 2019 08:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABBDD1833002;
	Mon,  1 Jul 2019 08:12:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SJk7g6012851 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 15:46:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DFA119C71; Fri, 28 Jun 2019 19:46:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2FD019C59;
	Fri, 28 Jun 2019 19:46:02 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id D052A308622B;
	Fri, 28 Jun 2019 19:45:19 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 5A4D22007696; Fri, 28 Jun 2019 12:45:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 4A08C301032E;
	Fri, 28 Jun 2019 12:45:11 -0700 (PDT)
Date: Fri, 28 Jun 2019 12:45:11 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20190628040041.GB673@sol.localdomain>
Message-ID: <alpine.LRH.2.21.1906281242110.2789@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 28 Jun 2019 19:45:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 28 Jun 2019 19:45:37 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jul 2019 04:11:25 -0400
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	gmazyland@gmail.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 01 Jul 2019 08:13:52 +0000 (UTC)


Hello Eric,
On Thu, 27 Jun 2019, Eric Biggers wrote:

> On Wed, Jun 19, 2019 at 12:10:47PM -0700, Jaskaran Khurana wrote:
>> This patch set adds in-kernel pkcs7 signature checking for the roothash of
>> the dm-verity hash tree.
>> The verification is to support cases where the roothash is not secured by
>> Trusted Boot, UEFI Secureboot or similar technologies.
>> One of the use cases for this is for dm-verity volumes mounted after boot,
>> the root hash provided during the creation of the dm-verity volume has to
>> be secure and thus in-kernel validation implemented here will be used
>> before we trust the root hash and allow the block device to be created.
>>
>> Why we are doing validation in the Kernel?
>>
>> The reason is to still be secure in cases where the attacker is able to
>> compromise the user mode application in which case the user mode validation
>> could not have been trusted.
>> The root hash signature validation in the kernel along with existing
>> dm-verity implementation gives a higher level of confidence in the
>> executable code or the protected data. Before allowing the creation of
>> the device mapper block device the kernel code will check that the detached
>> pkcs7 signature passed to it validates the roothash and the signature is
>> trusted by builtin keys set at kernel creation. The kernel should be
>> secured using Verified boot, UEFI Secure Boot or similar technologies so we
>> can trust it.
>>
>> What about attacker mounting non dm-verity volumes to run executable
>> code?
>>
>> This verification can be used to have a security architecture where a LSM
>> can enforce this verification for all the volumes and by doing this it can
>> ensure that all executable code runs from signed and trusted dm-verity
>> volumes.
>>
>> Further patches will be posted that build on this and enforce this
>> verification based on policy for all the volumes on the system.
>>
>
> I don't understand your justification for this feature.
>
> If userspace has already been pwned severely enough for the attacker to be
> executing arbitrary code with CAP_SYS_ADMIN (which is what the device mapper
> ioctls need), what good are restrictions on loading more binaries from disk?
>
> Please explain your security model.
>
> - Eric
>

In a datacenter like environment, this will protect the system from below 
attacks:

1.Prevents attacker from deploying scripts that run arbitrary executables on the system.
2.Prevents physically present malicious admin to run arbitrary code on the
   machine.

Regards,
Jaskaran

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

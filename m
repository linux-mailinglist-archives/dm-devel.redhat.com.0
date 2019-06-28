Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 709275A5F4
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 22:35:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6DFD8830E;
	Fri, 28 Jun 2019 20:35:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F4BC60920;
	Fri, 28 Jun 2019 20:35:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59C4554D3C;
	Fri, 28 Jun 2019 20:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SKZ59r021767 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 16:35:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41A491001B16; Fri, 28 Jun 2019 20:35:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB7E1001B1A;
	Fri, 28 Jun 2019 20:35:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38E71300180F;
	Fri, 28 Jun 2019 20:34:54 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 43EEE20828;
	Fri, 28 Jun 2019 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561754093;
	bh=QFyZmYCKzWAWjnce7iN2QQr+iL737LARfy//MkK70ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jETG2D35PRDLc03KmfIEhyoNjKddAVpbtnqHoYwvN+y8rPMvVsdUQSoVs4xw33lCO
	93u+tuW8+YmEGVsljD58jhmQn0LoIDVvW+NtIaWuXbS7IM12UfdpYKn1nEO/aYwhET
	WZpLj7Lgy45qi2a3DZhpsvPMziYsE+OmqghBfWBY=
Date: Fri, 28 Jun 2019 13:34:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
Message-ID: <20190628203450.GD103946@gmail.com>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
	<alpine.LRH.2.21.1906281242110.2789@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1906281242110.2789@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 28 Jun 2019 20:34:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 28 Jun 2019 20:34:54 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.932  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 28 Jun 2019 20:35:49 +0000 (UTC)

On Fri, Jun 28, 2019 at 12:45:11PM -0700, Jaskaran Singh Khurana wrote:
> 
> Hello Eric,
> On Thu, 27 Jun 2019, Eric Biggers wrote:
> 
> > On Wed, Jun 19, 2019 at 12:10:47PM -0700, Jaskaran Khurana wrote:
> > > This patch set adds in-kernel pkcs7 signature checking for the roothash of
> > > the dm-verity hash tree.
> > > The verification is to support cases where the roothash is not secured by
> > > Trusted Boot, UEFI Secureboot or similar technologies.
> > > One of the use cases for this is for dm-verity volumes mounted after boot,
> > > the root hash provided during the creation of the dm-verity volume has to
> > > be secure and thus in-kernel validation implemented here will be used
> > > before we trust the root hash and allow the block device to be created.
> > > 
> > > Why we are doing validation in the Kernel?
> > > 
> > > The reason is to still be secure in cases where the attacker is able to
> > > compromise the user mode application in which case the user mode validation
> > > could not have been trusted.
> > > The root hash signature validation in the kernel along with existing
> > > dm-verity implementation gives a higher level of confidence in the
> > > executable code or the protected data. Before allowing the creation of
> > > the device mapper block device the kernel code will check that the detached
> > > pkcs7 signature passed to it validates the roothash and the signature is
> > > trusted by builtin keys set at kernel creation. The kernel should be
> > > secured using Verified boot, UEFI Secure Boot or similar technologies so we
> > > can trust it.
> > > 
> > > What about attacker mounting non dm-verity volumes to run executable
> > > code?
> > > 
> > > This verification can be used to have a security architecture where a LSM
> > > can enforce this verification for all the volumes and by doing this it can
> > > ensure that all executable code runs from signed and trusted dm-verity
> > > volumes.
> > > 
> > > Further patches will be posted that build on this and enforce this
> > > verification based on policy for all the volumes on the system.
> > > 
> > 
> > I don't understand your justification for this feature.
> > 
> > If userspace has already been pwned severely enough for the attacker to be
> > executing arbitrary code with CAP_SYS_ADMIN (which is what the device mapper
> > ioctls need), what good are restrictions on loading more binaries from disk?
> > 
> > Please explain your security model.
> > 
> > - Eric
> > 
> 
> In a datacenter like environment, this will protect the system from below
> attacks:
> 
> 1.Prevents attacker from deploying scripts that run arbitrary executables on the system.
> 2.Prevents physically present malicious admin to run arbitrary code on the
>   machine.
> 
> Regards,
> Jaskaran

So you are trying to protect against people who already have a root shell?

Can't they just e.g. run /usr/bin/python and type in some Python code?

Or run /usr/bin/curl and upload all your secret data to their server.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

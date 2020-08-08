Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D948240213
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 08:48:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-LPTQEZlvOdeA6M86vZqbBQ-1; Mon, 10 Aug 2020 02:47:56 -0400
X-MC-Unique: LPTQEZlvOdeA6M86vZqbBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73DE019057A6;
	Mon, 10 Aug 2020 06:47:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C34D8BA11;
	Mon, 10 Aug 2020 06:47:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09EE397551;
	Mon, 10 Aug 2020 06:47:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 078HlxWw015810 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 8 Aug 2020 13:47:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DDF0217B439; Sat,  8 Aug 2020 17:47:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99E48217B438
	for <dm-devel@redhat.com>; Sat,  8 Aug 2020 17:47:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ED9480522D
	for <dm-devel@redhat.com>; Sat,  8 Aug 2020 17:47:57 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-268-RISjb1qJPRCqX-NvQ1lpMw-1; Sat, 08 Aug 2020 13:47:53 -0400
X-MC-Unique: RISjb1qJPRCqX-NvQ1lpMw-1
Received: by mail-il1-f195.google.com with SMTP id e16so4361757ilc.12;
	Sat, 08 Aug 2020 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iAERPz4z58eGuOuIGzzCzTvYKP+G7EsrZYPNaIwIkBM=;
	b=koeM7HF0QZb4/aj0XqR2cq0gOfeQPB+lg049uC1MycwzQ3Chm0uAt4Q4762wAiwcZr
	QZWBimRpbLV65t7RqyjR1pvhIku4uTtjbjDlLi3Kq841A4dhrJ5PYMPfPxflMggZO045
	Xw73o3sW7UVxVoQWcCVHNa25WOFKcP5pKx1hi0qpt0+SQ5lGXdznlkCacxnY8lhJcAfI
	rgS3aGSLG/SRXE1ud7rbR/dabRZ6DPeU13x6ZgSD/3YL719CSo42RqV4azR8H6mPaf0m
	GowHALHhEnjiuwnvjpIiL9rVQMmwki4xa34K2xEZ09galvyVOzuNECvZmeK9b/yJkiCH
	uvyA==
X-Gm-Message-State: AOAM530TXL9L+N5IG8JEawWYchB2tsLrmUcCXR0iPTTShlYDKFIiLFrT
	rCRNAp+h0MP+U0w8SFUzJWVcnKBRslPH2w==
X-Google-Smtp-Source: ABdhPJydDmiI01T5SSyOAkJmMCCoQ+jGkp7ojV9L+HpzqptYX/IPDvH/2YIt/u9cOo0zm++buEz1sw==
X-Received: by 2002:a92:340d:: with SMTP id b13mr10699165ila.78.1596908871622; 
	Sat, 08 Aug 2020 10:47:51 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	o74sm1908900ilb.40.2020.08.08.10.47.49
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Aug 2020 10:47:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
Date: Sat, 8 Aug 2020 13:47:48 -0400
Message-Id: <329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>, James Morris <jmorris@namei.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 078HlxWw015810
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 02:47:26 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 5, 2020, at 2:15 PM, Mimi Zohar <zohar@linux.ibm.com> wrote:
> 
> On Wed, 2020-08-05 at 09:59 -0700, James Morris wrote:
>> On Wed, 5 Aug 2020, James Bottomley wrote:
>> 
>>> I'll leave Mimi to answer, but really this is exactly the question that
>>> should have been asked before writing IPE.  However, since we have the
>>> cart before the horse, let me break the above down into two specific
>>> questions.
>> 
>> The question is valid and it was asked. We decided to first prototype what 
>> we needed and then evaluate if it should be integrated with IMA. We 
>> discussed this plan in person with Mimi (at LSS-NA in 2019), and presented 
>> a more mature version of IPE to LSS-NA in 2020, with the expectation that 
>> such a discussion may come up (it did not).
> 
> When we first spoke the concepts weren't fully formulated, at least to
> me.
>> 
>> These patches are still part of this process and 'RFC' status.
>> 
>>>   1. Could we implement IPE in IMA (as in would extensions to IMA cover
>>>      everything).  I think the answers above indicate this is a "yes".
>> 
>> It could be done, if needed.
>> 
>>>   2. Should we extend IMA to implement it?  This is really whether from a
>>>      usability standpoint two seperate LSMs would make sense to cover the
>>>      different use cases.
>> 
>> One issue here is that IMA is fundamentally a measurement & appraisal 
>> scheme which has been extended to include integrity enforcement. IPE was 
>> designed from scratch to only perform integrity enforcement. As such, it 
>> is a cleaner design -- "do one thing and do it well" is a good design 
>> pattern.
>> 
>> In our use-case, we utilize _both_ IMA and IPE, for attestation and code 
>> integrity respectively. It is useful to be able to separate these 
>> concepts. They really are different:
>> 
>> - Code integrity enforcement ensures that code running locally is of known 
>> provenance and has not been modified prior to execution.

My interest is in code integrity enforcement for executables stored
in NFS files.

My struggle with IPE is that due to its dependence on dm-verity, it
does not seem to able to protect content that is stored separately
from its execution environment and accessed via a file access
protocol (FUSE, SMB, NFS, etc).


>> - Attestation is about measuring the health of a system and having that 
>> measurement validated by a remote system. (Local attestation is useless).
>> 
>> I'm not sure there is value in continuing to shoe-horn both of these into 
>> IMA.
> 
> True, IMA was originally limited to measurement and attestation, but
> most of the original EVM concepts were subsequently included in IMA. 
> (Remember, Reiner Sailer wrote the original IMA, which I inherited.  I
> was originially working on EVM code integrity.)  From a naming
> perspective including EVM code integrity in IMA was a mistake.  My
> thinking at the time was that as IMA was already calculating the file
> hash, instead of re-calculating the file hash for integrity, calculate
> the file hash once and re-use it for multiple things - measurement, 
> integrity, and audit.   At the same time define a single system wide
> policy.
> 
> When we first started working on IMA, EVM, trusted, and encrypted keys,
> the general kernel community didn't see a need for any of it.  Thus, a
> lot of what was accomplished has been accomplished without the backing
> of the real core filesystem people.
> 
> If block layer integrity was enough, there wouldn't have been a need
> for fs-verity.   Even fs-verity is limited to read only filesystems,
> which makes validating file integrity so much easier.  From the
> beginning, we've said that fs-verity signatures should be included in
> the measurement list.  (I thought someone signed on to add that support
> to IMA, but have not yet seen anything.)

Mimi, when you and I discussed this during LSS NA 2019, I didn't fully
understand that you expected me to implement signed Merkle trees for all
filesystems. At the time, it sounded to me like you wanted signed Merkle
trees only for NFS files. Is that still the case?

The first priority (for me, anyway) therefore is getting the ability to
move IMA metadata between NFS clients and servers shoveled into the NFS
protocol, but that's been blocked for various legal reasons.

IMO we need agreement from everyone (integrity developers, FS
implementers, and Linux distributors) that a signed Merkle tree IMA
metadata format, stored in either an xattr or appended to an executable
file, will be the way forward for IMA in all filesystems.


> Going forward I see a lot of what we've accomplished being incorporated
> into the filesystems.  When IMA will be limited to defining a system
> wide policy, I'll have completed my job.
> 
> Mimi
> 
>> 
>>> I've got to say the least attractive thing
>>>      about separation is the fact that you now both have a policy parser.
>>>       You've tried to differentiate yours by making it more Kconfig
>>>      based, but policy has a way of becoming user space supplied because
>>>      the distros hate config options, so I think you're going to end up
>>>      with a policy parser very like IMAs.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


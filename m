Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 23EB8244534
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:06:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-RNE934FOPS66dyx848Knvw-1; Fri, 14 Aug 2020 03:06:16 -0400
X-MC-Unique: RNE934FOPS66dyx848Knvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6341835883;
	Fri, 14 Aug 2020 07:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BF6D600E4;
	Fri, 14 Aug 2020 07:06:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1727118199F7;
	Fri, 14 Aug 2020 07:06:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CEkCac027458 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 10:46:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD77A11918E8; Wed, 12 Aug 2020 14:46:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B848B119190C
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 14:46:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BAC6857024
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 14:46:07 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-152-YT8_bUNjOSKskT-JC_DIWQ-1; Wed, 12 Aug 2020 10:46:01 -0400
X-MC-Unique: YT8_bUNjOSKskT-JC_DIWQ-1
Received: by mail-il1-f195.google.com with SMTP id l7so1864960ils.2;
	Wed, 12 Aug 2020 07:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=kQOJV8hQKKWi1Q4IBwonjxI4nlnYdAyxL48CghY2b34=;
	b=b+BykxfZZy/GfxG3ZsY89aLaC7crjoKmrrh7Zy3E0QF77E9rszX2VQPGD/TBRIlYLR
	34Gy8YSv/EdVQPNJmUDqOdWtCCb+fHlytViJZBppRKT1ahuK2sCdlnGkPmiyh21OE+8A
	B+uDaOcBZGFVErTk+m+BmahPtFmKk5pQ25BPHBTYaDS9rSu/azN1Zxt8roQrlWXFJ5ri
	lAX3xW6do4NLZJBpLKCzaoRyGGH/Cwno7LwLx4N0L0j5zgF6XFIpTsNMoDnKNypoymC/
	6CUDgtsP3I9Gkc5iGFiFoxnLwd9AoljSrIjtZ2Me0dM/8cSIuQKlENLg1EZYIGR/VhpM
	p/uA==
X-Gm-Message-State: AOAM530y7PNw6yy7sUlaluAsqwfSjRzJ3EbNOKjSR9ijedxqnq2bZMQP
	Vq/2phhCLkMMpKcXsrfKhkc=
X-Google-Smtp-Source: ABdhPJwhgRbaRRSqe0vcGsrFV97VYVYstE/PFYHOorVWwg7UGiBOlCHPQtwmMYxo8Rf89OCc3e2t5w==
X-Received: by 2002:a92:6d0c:: with SMTP id i12mr8272ilc.37.1597243558796;
	Wed, 12 Aug 2020 07:45:58 -0700 (PDT)
Received: from anon-dhcp-152.1015granger.net
	(c-68-61-232-219.hsd1.mi.comcast.net. [68.61.232.219])
	by smtp.gmail.com with ESMTPSA id
	k14sm1089731ion.17.2020.08.12.07.45.56
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2020 07:45:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
From: Chuck Lever <chucklever@gmail.com>
In-Reply-To: <1597159969.4325.21.camel@HansenPartnership.com>
Date: Wed, 12 Aug 2020 10:45:56 -0400
Message-Id: <20F82AFA-D0AC-479B-AB1D-0D354AE19498@gmail.com>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
	<1597159969.4325.21.camel@HansenPartnership.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CEkCac027458
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, Pavel Machek <pavel@ucw.cz>,
	agk@redhat.com, Sasha Levin <sashal@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
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
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Aug 11, 2020, at 11:32 AM, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> On Tue, 2020-08-11 at 10:48 -0400, Chuck Lever wrote:
>>> On Aug 11, 2020, at 1:43 AM, James Bottomley
>>> <James.Bottomley@HansenPartnership.com> wrote:
>>> On Mon, 2020-08-10 at 19:36 -0400, Chuck Lever wrote:
> [...]
>>>> Thanks for the help! I just want to emphasize that documentation
>>>> (eg, a specification) will be critical for remote filesystems.
>>>> 
>>>> If any of this is to be supported by a remote filesystem, then we
>>>> need an unencumbered description of the new metadata format
>>>> rather than code. GPL-encumbered formats cannot be contributed to
>>>> the NFS standard, and are probably difficult for other
>>>> filesystems that are not Linux-native, like SMB, as well.
>>> 
>>> I don't understand what you mean by GPL encumbered formats.  The
>>> GPL is a code licence not a data or document licence.
>> 
>> IETF contributions occur under a BSD-style license incompatible
>> with the GPL.
>> 
>> https://trustee.ietf.org/trust-legal-provisions.html
>> 
>> Non-Linux implementers (of OEM storage devices) rely on such
>> standards processes to indemnify them against licensing claims.
> 
> Well, that simply means we won't be contributing the Linux
> implementation, right?

At the present time, there is nothing but the Linux implementation.
There's no English description, there's no specification of the
formats, the format is described only by source code.

The only way to contribute current IMA metadata formats to an open
standards body like the IETF is to look at encumbered code first.
We would effectively be contributing an implementation in this case.

(I'm not saying the current formats should or should not be
contributed; merely that there is a legal stumbling block to doing
so that can be avoided for newly defined formats).


> Well, let me put the counterpoint: I can write a book about how linux
> device drivers work (which includes describing the data formats)


Our position is that someone who reads that book and implements those
formats under a non-GPL-compatible license would be in breach of the
GPL.

The point of the standards process is to indemnify implementing
and distributing under _any_ license what has been published by the
standards body. That legally enables everyone to use the published
protocol/format in their own code no matter how it happens to be
licensed.


> Fine, good grief, people who take a sensible view of this can write the
> data format down and publish it under any licence you like then you can
> pick it up again safely.


That's what I proposed. Write it down under the IETF Trust legal
provisions license. And I volunteered to do that.

All I'm saying is that description needs to come before code.


--
Chuck Lever
chucklever@gmail.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


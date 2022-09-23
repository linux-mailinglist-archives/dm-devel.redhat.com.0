Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F11B65E7C82
	for <lists+dm-devel@lfdr.de>; Fri, 23 Sep 2022 16:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663942113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CW8jK8ys0LXE1hpuwh/CzGrKwcmljI1EKkDC1Uo4pzs=;
	b=goEq4/0JaH6odXi/4JEENPWCxDRqJ02wRCbz7xR5FCzWOmJsgcAAY1H4nRE+v2NQYnh5Vf
	JP3gD8LWbZ8jwCtKtyaBeKZnt3bb6MoPrXLoyLZ3kN1n79exPGAXwc2vPd6sG3n4h4tIEM
	IryxSCngQ2pn8JAx1ABklywKAntaBxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-qLj-8Of0O6C8HpytCEAa5A-1; Fri, 23 Sep 2022 10:08:31 -0400
X-MC-Unique: qLj-8Of0O6C8HpytCEAa5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1719A85A59D;
	Fri, 23 Sep 2022 14:08:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BCC8140EBF4;
	Fri, 23 Sep 2022 14:08:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4559C1946A66;
	Fri, 23 Sep 2022 14:08:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7326D19465A4
 for <dm-devel@listman.corp.redhat.com>; Fri, 23 Sep 2022 14:08:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51A96112131B; Fri, 23 Sep 2022 14:08:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6E9112132C
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 14:08:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BA00858F13
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 14:08:15 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-4TnUOwZ8PFSq_J2inzGQew-1; Fri, 23 Sep 2022 10:08:13 -0400
X-MC-Unique: 4TnUOwZ8PFSq_J2inzGQew-1
Received: by mail-qk1-f200.google.com with SMTP id
 i7-20020a05620a404700b006ced0d02b68so96334qko.10
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 07:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=LBYIB5Hr/s79C5MbXbGY0mfsUxmhEdiC6zxTkuGSCwk=;
 b=2NNApYRnw2qjv+w4eDBa2YD6MdovQq7tW75kC0WPH8d9+quuZgaxlA02netZHG2Oyp
 2En73QjjYAh0iK+do3IcpptwTU2RumL0rCafV9D4Hw5DEdrthR9yuKI3WHfmRL7Tci00
 dTKHzb+5K+2PE/Gw+XVB1nT8y+M+vLtY8bkw6FemIYA4ObpLRLkj4b+xk6liNXn2n0UB
 JAOPtH1j8wTBDE3YX78HQpXKzytrR0ulhFWG3Eeu/jXCldyo9l1B/Fg7rg99xLMLGlce
 ehboZCH5m56jQEbc8iKnGW9L7l+0IRWssSjOFAxSHEyBt45La9GQyMwqzA5kpJ/+gsnT
 WXCg==
X-Gm-Message-State: ACrzQf04Bn/PrA4CuhbtqGKXESvcL68zgIdug1aEvqm1aDLkBft0MQe/
 ATSzeKOYf2NiOLUOsJu1Qz6eMYXPoMcd124JGkoU+9k13IVyQqxSQ6/yXHqXU9o3ifKSu7WguBm
 XfzWFoRMd+rnZJw==
X-Received: by 2002:ac8:5dc9:0:b0:35c:dac8:a141 with SMTP id
 e9-20020ac85dc9000000b0035cdac8a141mr7271315qtx.229.1663942093308; 
 Fri, 23 Sep 2022 07:08:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hP35ZcbFzjjav7W2Ml66N3dqlsgPCpf9kKzESU216uoZsCAsOatn0mJ4gZX5U/fSihe9dkw==
X-Received: by 2002:ac8:5dc9:0:b0:35c:dac8:a141 with SMTP id
 e9-20020ac85dc9000000b0035cdac8a141mr7271263qtx.229.1663942092916; 
 Fri, 23 Sep 2022 07:08:12 -0700 (PDT)
Received: from localhost (pool-68-160-173-162.bstnma.fios.verizon.net.
 [68.160.173.162]) by smtp.gmail.com with ESMTPSA id
 cq3-20020a05622a424300b0035ced0a8382sm5566028qtb.54.2022.09.23.07.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 07:08:12 -0700 (PDT)
Date: Fri, 23 Sep 2022 10:08:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Yy29y/jUvWM6GRZ5@redhat.com>
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
 <YyQTM5PRT2o/GDwy@fedora>
 <CAG9=OMPHZqdDhX=M+ovdg5fa3x4-Q_1r5SWPa8pMTQw0mr5fPg@mail.gmail.com>
 <Yylvvm3zVgqpqDrm@infradead.org>
 <CAAKderPF5Z5QLxyEb80Y+90+eR0sfRmL-WfgXLp=eL=HxWSZ9g@mail.gmail.com>
 <YymkSDsFVVg1nbDP@infradead.org>
 <CAAKderNcHpbBqWqqd5-WuKLRCQQUt7a_4D4ti4gy15+fKGK0vQ@mail.gmail.com>
 <Yy1zkMH0f9ski4Sg@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Yy1zkMH0f9ski4Sg@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH RFC 0/8] Introduce provisioning primitives
 for thinly provisioned storage
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Gwendal Grignou <gwendal@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bart Van Assche <bvanassche@google.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>, Daniil Lunev <dlunev@google.com>,
 Sarthak Kukreti <sarthakkukreti@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-ext4@vger.kernel.org,
 Evan Green <evgreen@google.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 23 2022 at  4:51P -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Sep 21, 2022 at 07:48:50AM +1000, Daniil Lunev wrote:
> > > There is no such thing as WRITE UNAVAILABLE in NVMe.
> > Apologize, that is WRITE UNCORRECTABLE. Chapter 3.2.7 of
> > NVM Express NVM Command Set Specification 1.0b
> 
> Write uncorrectable is a very different thing, and the equivalent of the
> horribly misnamed SCSI WRITE LONG COMMAND.  It injects an unrecoverable
> error, and does not provision anything.
> 
> > * Each application is potentially allowed to consume the entirety
> >   of the disk space - there is no strict size limit for application
> > * Applications need to pre-allocate space sometime, for which
> >   they use fallocate. Once the operation succeeded, the application
> >   assumed the space is guaranteed to be there for it.
> > * Since filesystems on the volumes are independent, filesystem
> >   level enforcement of size constraints is impossible and the only
> >   common level is the thin pool, thus, each fallocate has to find its
> >   representation in thin pool one way or another - otherwise you
> >   may end up in the situation, where FS thinks it has allocated space
> >   but when it tries to actually write it, the thin pool is already
> >   exhausted.
> > * Hole-Punching fallocate will not reach the thin pool, so the only
> >   solution presently is zero-writing pre-allocate.
> 
> To me it sounds like you want a non-thin pool in dm-thin and/or
> guaranted space reservations for it.

What is implemented in this patchset: enablement for dm-thinp to
actually provide guarantees which fallocate requires.

Seems you're getting hung up on the finishing details in HW (details
which are _not_ the point of this patchset).

The proposed changes are in service to _Linux_ code. The patchset
implements the primitive from top (ext4) to bottom (dm-thinp, loop).
It stops short of implementing handling everywhere that'd need it
(e.g. in XFS, etc). But those changes can come as follow-on work once
the primitive is established top to bottom.

But you know all this ;)

> > * Thus, a provisioning block operation allows an interface specific
> >   operation that guarantees the presence of the block in the
> >   mapped space. LVM Thin-pool itself is the primary target for our
> >   use case but the argument is that this operation maps well to
> >   other interfaces which allow thinly provisioned units.
> 
> I think where you are trying to go here is badly mistaken.  With flash
> (or hard drive SMR) there is no such thing as provisioning LBAs.  Every
> write is out of place, and a one time space allocation does not help
> you at all.  So fundamentally what you try to here just goes against
> the actual physics of modern storage media.  While there are some
> layers that keep up a pretence, trying to that an an exposed API
> level is a really bad idea.

This doesn't need to be so feudal.  Reserving an LBA in physical HW
really isn't the point.

Fact remains: an operation that ensures space is actually reserved via
fallocate is long overdue (just because an FS did its job doesn't mean
underlying layers reflect that). And certainly useful, even if "only"
benefiting dm-thinp and the loop driver. Like other block primitives,
REQ_OP_PROVISION is filtered out by block core if the device doesn't
support it.

That said, I agree with Brian Foster that we need really solid
documentation and justification for why fallocate mode=0 cannot be
used (but the case has been made in this thread).

Also, I do see an issue with the implementation (relative to stacked
devices): dm_table_supports_provision() is too myopic about DM. It
needs to go a step further and verify that some layer in the stack
actually services REQ_OP_PROVISION. Will respond to DM patch too.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6300C23F3A3
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 22:15:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-T8v1OvZQO-ahDdX-ufaVMw-1; Fri, 07 Aug 2020 16:15:42 -0400
X-MC-Unique: T8v1OvZQO-ahDdX-ufaVMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09D018FF662;
	Fri,  7 Aug 2020 20:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24CB85D9D5;
	Fri,  7 Aug 2020 20:15:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC3B7A552A;
	Fri,  7 Aug 2020 20:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077KC7Hi006122 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 16:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDA0C207B167; Fri,  7 Aug 2020 20:12:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D51207AFD0
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 20:12:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB4E805C1E
	for <dm-devel@redhat.com>; Fri,  7 Aug 2020 20:12:03 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-36-_f-y2wXSNAatsHyWnxomiA-1; Fri, 07 Aug 2020 16:12:01 -0400
X-MC-Unique: _f-y2wXSNAatsHyWnxomiA-1
Received: by mail-lj1-f194.google.com with SMTP id f26so2083286ljc.8
	for <dm-devel@redhat.com>; Fri, 07 Aug 2020 13:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xkIYoRLWBrMd2qKy9T6QTqGHxJXs4ojV9w6Sr9SIdls=;
	b=Lt0bN6iZD+uzkdIvA733OVC1VBGhzWSFqz04rW7oMQz3c5s2qFKd6L0JrlSK+48GnC
	zgzACkCnQNMxaYSnUhfitmyAKMz/3d24d9MjJQ//mj+hf4FIm33e+1fKycPQHbnybuPt
	rM09eQRajOEPF09Q53cHCa/c/irgjwOLmcjLFTGJnuhARXZEF4xCBdDyHQ7TA0Nsd6Rb
	WEKNTy59hEQD7EkByVNkE5U0wRHyTGABg2oosZzXMYkit+RBxZ0riCNdFtybx5tSm6Hs
	Km1oQH0kAZ5BkjRvgchqhAqFqzo4Y2Bw6hzKVW4Vb+/G/i+UK1m1az1oNRDW66LZbVth
	Fsgw==
X-Gm-Message-State: AOAM532wNBdcdNWeIn+ILtca+AIP7mY+2Xc7njZaG+bHmR7+nzYB/7s2
	rxSzYevjU/so2ErV9O24g/iFslRYscSclg==
X-Google-Smtp-Source: ABdhPJytgZcEZYNnH/4zgnaEm0EZAv7QPK9hOw2VtDyvanaOlFt7tIOUjsL666ml/Un8Ib8WJoH+vg==
X-Received: by 2002:a2e:9e8a:: with SMTP id f10mr5308581ljk.330.1596831117588; 
	Fri, 07 Aug 2020 13:11:57 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
	[209.85.208.179]) by smtp.gmail.com with ESMTPSA id
	g21sm4223015ljh.103.2020.08.07.13.11.55 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 07 Aug 2020 13:11:55 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id g6so3446940ljn.11
	for <dm-devel@redhat.com>; Fri, 07 Aug 2020 13:11:55 -0700 (PDT)
X-Received: by 2002:a2e:b008:: with SMTP id y8mr6135959ljk.421.1596831114811; 
	Fri, 07 Aug 2020 13:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
In-Reply-To: <20200807160327.GA977@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Aug 2020 13:11:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
Message-ID: <CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, John Dorminy <jdorminy@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 7, 2020 at 9:03 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> - DM crypt improvement to optionally avoid async processing via
>   workqueues for reads and/or writes -- via "no_read_workqueue" and
>   "no_write_workqueue" features.  This more direct IO processing
>   improves latency and throughput with faster storage.  Avoiding
>   workqueue IO submission for writes (DM_CRYPT_NO_WRITE_WORKQUEUE) is
>   a requirement for adding zoned block device support to DM crypt.

Is there a reason the async workqueue isn't removed entirely if it's not a win?

Or at least made to not be the default.

Now it seems to be just optionally disabled, which seems the wrong way
around to me.

I do not believe async crypto has ever worked or been worth it.
Off-loaded crypto in the IO path, yes. Async using a workqueue? Naah.

Or do I misunderstand?

               Linus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


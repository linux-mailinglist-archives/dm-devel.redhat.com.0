Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87F12211FA6
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 11:18:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-vr0dXo6IOPic0cAveg1VYw-1; Thu, 02 Jul 2020 05:18:49 -0400
X-MC-Unique: vr0dXo6IOPic0cAveg1VYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 739171B18BC0;
	Thu,  2 Jul 2020 09:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043AE19C66;
	Thu,  2 Jul 2020 09:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D22C51809547;
	Thu,  2 Jul 2020 09:18:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0625jLUr002511 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 01:45:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 232A92144B3A; Thu,  2 Jul 2020 05:45:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C07D2144B4F
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 05:45:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57841800883
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 05:45:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-451-Zd19IkM6NbGnBLS-eDxP3w-1;
	Thu, 02 Jul 2020 01:45:16 -0400
X-MC-Unique: Zd19IkM6NbGnBLS-eDxP3w-1
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7167520884
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 05:36:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id n23so30154667ljh.7
	for <dm-devel@redhat.com>; Wed, 01 Jul 2020 22:36:26 -0700 (PDT)
X-Gm-Message-State: AOAM532RRkys73o7q3hUkxwM88Lia29ZY1LGLEquTl9PqYB1/Nikbfca
	ByBeB4xldzyXwEWKXX3xZRtv8ObIXm924517Imw=
X-Google-Smtp-Source: ABdhPJymqO+8A/ON6cgRlyAmaadzhb/A3ETkgEahkbFx3Wp1rU/jFwtY3MDkzrSEOGWene4L2hOwuUlW51s/XrqmVQI=
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr4621445ljd.446.1593668184748; 
	Wed, 01 Jul 2020 22:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200701090622.3354860-1-hch@lst.de>
	<20200701090622.3354860-5-hch@lst.de>
In-Reply-To: <20200701090622.3354860-5-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 1 Jul 2020 22:36:13 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7QShNMnbCK-OrKkE8F5XyH45-ML-w5qKLVrO=VTt6npw@mail.gmail.com>
Message-ID: <CAPhsuW7QShNMnbCK-OrKkE8F5XyH45-ML-w5qKLVrO=VTt6npw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Jul 2020 05:18:19 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>, linux-bcache@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 4/4] writeback: remove bdi->congested_fn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 1, 2020 at 2:06 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Except for pktdvd, the only places setting congested bits are file
> systems that allocate their own backing_dev_info structures.  And
> pktdvd is a deprecated driver that isn't useful in stack setup
> either.  So remove the dead congested_fn stacking infrastructure.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For md bits:

Acked-by: Song Liu <song@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


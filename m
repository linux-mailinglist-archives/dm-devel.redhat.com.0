Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BB3652134ED
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 09:27:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-N53aBaPuNZCSdF9lKbrsVA-1; Fri, 03 Jul 2020 03:26:44 -0400
X-MC-Unique: N53aBaPuNZCSdF9lKbrsVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DDF38015F5;
	Fri,  3 Jul 2020 07:26:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 498AC6111F;
	Fri,  3 Jul 2020 07:26:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 052E01809547;
	Fri,  3 Jul 2020 07:26:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062IMWOw015797 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 14:22:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F576103285; Thu,  2 Jul 2020 18:22:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A75CF7FDB
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 18:22:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2CAF858EE2
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 18:22:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-9-3g9d6UrgPhmn_p894xNWpA-1;
	Thu, 02 Jul 2020 14:22:27 -0400
X-MC-Unique: 3g9d6UrgPhmn_p894xNWpA-1
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6B1C521527
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 18:22:25 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id b25so29855417ljp.6
	for <dm-devel@redhat.com>; Thu, 02 Jul 2020 11:22:25 -0700 (PDT)
X-Gm-Message-State: AOAM532Xq97FM4791kyOCvFsqVjASRVaw9SlNIWsfyUMw0ryS75T7x1J
	H7VMPbvGrP9yiivjLLlXAuB8KXd2B8zT8podQDE=
X-Google-Smtp-Source: ABdhPJwzHQSAgDG5LZKrrq4sCwOryNIpxeUx+J+pLZvaBWcsyRJefETEyU+mlLl9hUoA9U/QBDPE51PBpf0COAdEZgQ=
X-Received: by 2002:a2e:9901:: with SMTP id v1mr17432874lji.41.1593714143665; 
	Thu, 02 Jul 2020 11:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
	<20200701085947.3354405-18-hch@lst.de>
In-Reply-To: <20200701085947.3354405-18-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Thu, 2 Jul 2020 11:22:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4=eiN2-_cy5vCn_RGwmYRf37jOX4DWTvUCDWAqRzU+pw@mail.gmail.com>
Message-ID: <CAPhsuW4=eiN2-_cy5vCn_RGwmYRf37jOX4DWTvUCDWAqRzU+pw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 03:26:16 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [PATCH 17/20] block: rename generic_make_request to
	submit_bio_noacct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 1, 2020 at 2:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> generic_make_request has always been very confusingly misnamed, so rename
> it to submit_bio_noacct to make it clear that it is submit_bio minus
> accounting and a few checks.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[...]

>  drivers/md/md-faulty.c                        |  4 +--
>  drivers/md/md-linear.c                        |  4 +--
>  drivers/md/md-multipath.c                     |  4 +--
>  drivers/md/raid0.c                            |  8 ++---
>  drivers/md/raid1.c                            | 14 ++++----
>  drivers/md/raid10.c                           | 28 ++++++++--------
>  drivers/md/raid5.c                            | 10 +++---

For md part:

Acked-by: Song Liu <song@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


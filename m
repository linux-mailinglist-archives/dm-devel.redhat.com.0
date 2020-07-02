Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 426CD211FA5
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 11:18:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-cYxW8Hg2Ntu1BQayE4ofLg-1; Thu, 02 Jul 2020 05:18:48 -0400
X-MC-Unique: cYxW8Hg2Ntu1BQayE4ofLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEFED107B271;
	Thu,  2 Jul 2020 09:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 062002B5BA;
	Thu,  2 Jul 2020 09:18:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D27271809554;
	Thu,  2 Jul 2020 09:18:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0626Empb006030 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 02:14:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD02B10EE78D; Thu,  2 Jul 2020 06:14:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84C010145E3
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 06:14:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E32CC858F07
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 06:14:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-304-4uMjNBFiPyaciMyktOiRGQ-1;
	Thu, 02 Jul 2020 02:14:44 -0400
X-MC-Unique: 4uMjNBFiPyaciMyktOiRGQ-1
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 266C820899
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 06:14:43 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id e4so30258428ljn.4
	for <dm-devel@redhat.com>; Wed, 01 Jul 2020 23:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM532EPUZMnTKZABas7QTQtMcvodKUeNfRVyBZrZZL2H4vWnFYbtr1
	ME0SyQBQN9y8EcLocvAlqaMjx06UXtB3dTVnxV4=
X-Google-Smtp-Source: ABdhPJyW7ZQG/gxodV+UBsSp8muv8lWxec/bTY9tvW0qqCeZQo8oSQL9G2bg+h67AMeeX8NyXrYP1bqMgId6X08X7/E=
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr11256607ljk.27.1593670481513; 
	Wed, 01 Jul 2020 23:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
	<20200701085947.3354405-13-hch@lst.de>
In-Reply-To: <20200701085947.3354405-13-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Wed, 1 Jul 2020 23:14:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
Message-ID: <CAPhsuW5=055Eo-b3fjC_b-nJz-fg1FGwy_aqrNNtHm-U8vut-A@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Jul 2020 05:18:19 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [PATCH 12/20] block: remove the request_queue
	argument from blk_queue_split
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

On Wed, Jul 1, 2020 at 2:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The queue can be trivially derived from the bio, so pass one less
> argument.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[...]
>  drivers/md/md.c               |  2 +-

For md.c:
Acked-by: Song Liu <song@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


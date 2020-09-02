Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3C425BB36
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:48:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-NiHBc996M_OsbdRIr038kw-1; Thu, 03 Sep 2020 02:48:49 -0400
X-MC-Unique: NiHBc996M_OsbdRIr038kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0251006710;
	Thu,  3 Sep 2020 06:48:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B04245D9CC;
	Thu,  3 Sep 2020 06:48:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 459CC79DBB;
	Thu,  3 Sep 2020 06:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08265WMc020937 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 02:05:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE12010031E5; Wed,  2 Sep 2020 06:05:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A794A100335C
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:05:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1580587EF93
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:05:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-27-kOE-OOXOMeS49mFE6QVsxQ-1; 
	Wed, 02 Sep 2020 02:05:28 -0400
X-MC-Unique: kOE-OOXOMeS49mFE6QVsxQ-1
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5DB8C2084C
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:00:05 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id s205so4385075lja.7
	for <dm-devel@redhat.com>; Tue, 01 Sep 2020 23:00:05 -0700 (PDT)
X-Gm-Message-State: AOAM53040MFpPEl+yuQUktQ4rhpEMSy1KX6mcWiQvNrKhdu82TONFqOQ
	9m4X5x8il0cOvfT1mMD1T9dC3TrC7QcTNOt9qDc=
X-Google-Smtp-Source: ABdhPJwf3HULiufgbpwKVoPwmf+LkIKFmte7J3KnU2uOXqQt3v5M5F/QoyNcLdziLtm9PrTb/1L0NAY4kWOOlCFV810=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr2427127lji.41.1599026403505; 
	Tue, 01 Sep 2020 23:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-10-hch@lst.de>
In-Reply-To: <20200901155748.2884-10-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 1 Sep 2020 22:59:52 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7YKTHsWnqv22gq6VEz29=abYk7ADsxcQr9q3_kGZuiXw@mail.gmail.com>
Message-ID: <CAPhsuW7YKTHsWnqv22gq6VEz29=abYk7ADsxcQr9q3_kGZuiXw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 02:48:19 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, open list <linux-kernel@vger.kernel.org>,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 9/9] block: remove revalidate_disk()
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 1, 2020 at 9:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Remove the now unused helper.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


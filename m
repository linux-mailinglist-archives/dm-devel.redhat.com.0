Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2EA226F81
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 22:13:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Rq9XyEapNE2HM0frsqX_tg-1; Mon, 20 Jul 2020 16:13:53 -0400
X-MC-Unique: Rq9XyEapNE2HM0frsqX_tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B412D100CCCC;
	Mon, 20 Jul 2020 20:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9E6108BD16;
	Mon, 20 Jul 2020 20:13:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 876999A12B;
	Mon, 20 Jul 2020 20:13:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KBwfBE006683 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 07:58:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B18A2156709; Mon, 20 Jul 2020 11:58:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345042156708
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 11:58:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33F2E1832D22
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 11:58:39 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-Yai3zHNWMNaMhDKKbPUpZQ-1; Mon, 20 Jul 2020 07:58:34 -0400
X-MC-Unique: Yai3zHNWMNaMhDKKbPUpZQ-1
Received: by mail-qk1-f195.google.com with SMTP id z15so8124117qki.10;
	Mon, 20 Jul 2020 04:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oyadEz0eZwOz4veMiu/99Xwk84Lj2bAOI1P6STGAbTM=;
	b=Lr/zhggG+ylAHWv+XHNloDTdK3QP7z4efIFwR76wjABPPijgCIOvUjxIz16ByViGJV
	ElTcpdekVJV2VDKB9Wv7MSnu/jaPwStXUVacBDXTGpjfkKEgVVF/2Qs3L+0KFQtL7oXf
	bATy2Bct/WOtUC/IbNhcrgjoD5eObcPZfJZ9ZGzIzqSSbcVIrlzpPLsqcSw9xnZ4YCk5
	ORpnifl/i4/LjDstyuGfb3LL5TqM42r+7QygrbriuwcFVlJ7oFNvdZNFRaCJollmt6gF
	3TAU/YoEYRc954DLesOTxmXTu5DwwrZwSx7F/UsNdSlQuTOWv8ogS9fJolaZ7Bvj+Iuj
	SZFg==
X-Gm-Message-State: AOAM533hqhi6tWoyMZM8SQpnN7+fd+x5u2WWEPTUqSKHUfsRl/AZEdgW
	WcVa7QmHLfvkDW2yoqf4nf1lOp7Ti5wEFQ1DOjj29oXL
X-Google-Smtp-Source: ABdhPJxZvpi5p/rGIGspu/X0VuST2fAly2yyAucRwLGlbJciYxHfYOGN4y9O3LRxtfeMHSSpDlexGGV5rTPgQNTp1kc=
X-Received: by 2002:a37:9147:: with SMTP id t68mr20753351qkd.34.1595246313907; 
	Mon, 20 Jul 2020 04:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200720075148.172156-1-hch@lst.de>
	<20200720075148.172156-5-hch@lst.de>
In-Reply-To: <20200720075148.172156-5-hch@lst.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 20 Jul 2020 13:58:22 +0200
Message-ID: <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 16:13:03 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-mtd@lists.infradead.org,
	cgroups mailinglist <cgroups@vger.kernel.org>, drbd-dev@tron.linbit.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Chrstoph,

On Mon, Jul 20, 2020 at 9:53 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Set up a readahead size by default.  This changes behavior for mtd,
> ubifs, and vboxsf to actually enabled readahead, the lack of which
> very much looks like an oversight.

UBIFS doesn't enable readahead on purpose, please see:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_readahead

-- 
Thanks,
//richard

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


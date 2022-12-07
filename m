Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA9645B08
	for <lists+dm-devel@lfdr.de>; Wed,  7 Dec 2022 14:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670420248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K2yp2PeVlv3lIHo1pcvwZ2lKBn+Qkxp7V5+xFGWlAEA=;
	b=GNyK7WCDQaKqb00fPm/2U6BUR0wt2FjIyONL37eUaNvqy/sHcLBAZWP7uY9qkKoTKy8wqC
	m4sD3yuuxvfo0LKy9vnY6s+AAr0xu8yDYwUPfmDUDiGSo9R1j6g/WDyzN5z9pe3qGcn/GT
	g/124bsgbNKQsL80B7Mi/t1LOgtamN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-v1x1pznPMwC5qmNkuc8lgw-1; Wed, 07 Dec 2022 08:37:26 -0500
X-MC-Unique: v1x1pznPMwC5qmNkuc8lgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5347C801585;
	Wed,  7 Dec 2022 13:37:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9987C15BA4;
	Wed,  7 Dec 2022 13:37:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 749031946A75;
	Wed,  7 Dec 2022 13:37:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 158B519465B1
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Dec 2022 10:21:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6DFE492B05; Wed,  7 Dec 2022 10:21:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FFBA492B04
 for <dm-devel@redhat.com>; Wed,  7 Dec 2022 10:21:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84E8F185A7AD
 for <dm-devel@redhat.com>; Wed,  7 Dec 2022 10:21:55 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-bjBsythsNBWQZ2HrNjpfOQ-1; Wed, 07 Dec 2022 05:21:54 -0500
X-MC-Unique: bjBsythsNBWQZ2HrNjpfOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h10-20020adfaa8a000000b0024208cf285eso4121368wrc.22
 for <dm-devel@redhat.com>; Wed, 07 Dec 2022 02:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPzI0+evVSHS3ztOGGIP3CFHgC5aN3okr0QkVN6UmJ0=;
 b=Qik458vaM03zXw3B3VGj+BrdP4FwHPV8+AFjiFARi5iTokKKWZh97jDlsPTpuccLWe
 rOol3w0c35iltCnUQq4JcPrny0i9WE/M7hC6CC3QhvPnukNuzWHTaskeT0kJxmsGw5kh
 hmGG4lnwt5D0AUeuF54th3CnvTvPes6274R0g2Mk3YoNznSXZ3hLEaFrJeXyecMUp231
 s0lXUjBest9V3yAgFZVzGr19EQr7fNiowahbUDO4NaRYfBqX8lONKl5UZzaspdaSk1FY
 o1X9N9577diBSHKjMdHHYIF7DqPdfhDlxVBoHQxX568/zdo86ArXvTlzTTujA0BNJ9En
 nDUw==
X-Gm-Message-State: ANoB5pkymHJAuADAtZDP1aY71+gXu6PwM7nSm6tXJyq4+NZTKzI6YzmK
 rqMMacB7JjNhUiE+kWNm/frNS5mcDwRTC/jOPh8I9J6LXbuGOYNyWoV9Bo2W7TGRS8ttkDAvDpW
 mEtME8a6VWuTSyG4=
X-Received: by 2002:a5d:6745:0:b0:242:7e6:a0a0 with SMTP id
 l5-20020a5d6745000000b0024207e6a0a0mr32733379wrw.512.1670408513093; 
 Wed, 07 Dec 2022 02:21:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7DMVf3SQ+wTGuF0LUdq4DNgtoQvJFTl9h4t7vhp8I5BZbj8QdljNko1W2iVKGLUD6JkmsMhA==
X-Received: by 2002:a5d:6745:0:b0:242:7e6:a0a0 with SMTP id
 l5-20020a5d6745000000b0024207e6a0a0mr32733365wrw.512.1670408512850; 
 Wed, 07 Dec 2022 02:21:52 -0800 (PST)
Received: from redhat.com ([2.52.154.114]) by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm13739316wrs.88.2022.12.07.02.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:21:52 -0800 (PST)
Date: Wed, 7 Dec 2022 05:21:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20221207052001-mutt-send-email-mst@kernel.org>
References: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
 <Y5BCQ/9/uhXdu35W@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y5BCQ/9/uhXdu35W@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 07 Dec 2022 13:37:16 +0000
Subject: Re: [dm-devel] [PATCH v3] virtio_blk: add VIRTIO_BLK_F_LIFETIME
 feature support
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 06, 2022 at 11:35:31PM -0800, Christoph Hellwig wrote:
> This just seems like a horrible interface.  And virtio-blk should be
> a simple passthrough and not grow tons of side-band crap like this.
> 
> If you want to pass through random misc information use virtio-scsi
> or nvme with shadow doorbell buffers.

Christoph you acked the spec patch adding this to virtio blk:

	Still not a fan of the encoding, but at least it is properly documented
	now:

	Acked-by: Christoph Hellwig <hch@lst.de>

Did you change your mind then? Or do you prefer a different encoding for
the ioctl then? could you help sugesting what kind?

Thanks,

-- 
MST

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


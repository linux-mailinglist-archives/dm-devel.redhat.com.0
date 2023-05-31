Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5EC718B59
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 22:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685565660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UpK+pXFuBT6lzez0y9IzJASSpOvGXrz8W3K4aPs0bBw=;
	b=LMYVJkQzlvlk93ccehs/BnH4tCQY6e7erI3MeJhaIfhyyPZbCtPeoDA2xS0g7oQv7EPSoc
	XIyel5cHbn809+zqWDRhiIDeZwsont+rIYDJ73PQOMVldlAN0Tbp7b8z3WZtRCMf9/VGXW
	izVvL+6Bu+B2wec9H4o3INBtj2P0n2Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-kL3tRu7eMzSkxX9khb1HLA-1; Wed, 31 May 2023 16:40:59 -0400
X-MC-Unique: kL3tRu7eMzSkxX9khb1HLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 113603828887;
	Wed, 31 May 2023 20:40:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94BA62029F6D;
	Wed, 31 May 2023 20:40:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26A601946A42;
	Wed, 31 May 2023 20:40:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 567C119465B7
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 20:40:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 105D040CFD09; Wed, 31 May 2023 20:40:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A4840CFD08
 for <dm-devel@redhat.com>; Wed, 31 May 2023 20:40:48 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E4F63C11C69
 for <dm-devel@redhat.com>; Wed, 31 May 2023 20:40:48 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-4PqNMADUNiy0vzGQfoiYMQ-1; Wed, 31 May 2023 16:40:46 -0400
X-MC-Unique: 4PqNMADUNiy0vzGQfoiYMQ-1
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-75b0b2d0341so649766585a.3
 for <dm-devel@redhat.com>; Wed, 31 May 2023 13:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565646; x=1688157646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2MHMFRCtTpRq4HekvDMncZqof6fHitP/tkQ4Bwp4iw=;
 b=Pzmznpq5TUk7vVAiiK2+yroCgQcG9LwiJe5cAjudzKxEfjFezyLjoA0BSwF8RutiQB
 NZwbnEqPD9eJ/bXi4SfMRHHRrPd/22cRz9BFCEVEBsvfssdVJBQCcOqwMjJqp7k+z9Yg
 Kr+qW8sItcstFz5PTxk7b2lDgm7ss8t6me5Gba11HB/hydUv7lETfDD4W+0LgMBqC+sa
 L9DyiXAZ8uxGWHMvpkCNwpL8zwEvzSwEvuss7KpMJ6nAHn8KqoyoRHnWk4+P6UeliCB5
 Ekj3zsyvXh9zTiN0lgcJUcKIZwp++pQSOlBPPd2vuOwudV/iDphnrja4DOlRUFr5jirL
 e5oA==
X-Gm-Message-State: AC+VfDw+/RpRg5PLVHoQVyO9nYpF8c8sxHFMmNdxsyCFJ3OnWdHCITp3
 D6lK+EHbo1KaJe+i9XoAEE0tgUs=
X-Google-Smtp-Source: ACHHUZ5kdx7S499hJRV8/H2S3RWG6Tr6vcGeL7BQ9XuPUWxOMtGzpZSxerK1wVcQWCuUeme2JGtCZA==
X-Received: by 2002:a05:6214:d85:b0:616:5f27:b96a with SMTP id
 e5-20020a0562140d8500b006165f27b96amr7207768qve.27.1685565645712; 
 Wed, 31 May 2023 13:40:45 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05621412cc00b005fe4a301350sm6354991qvv.48.2023.05.31.13.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 13:40:45 -0700 (PDT)
Date: Wed, 31 May 2023 16:40:44 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Sarthak Kukreti <sarthakkukreti@chromium.org>, Jens Axboe <axboe@kernel.dk>
Message-ID: <ZHewzOfOdXu+kN75@redhat.com>
References: <20230518223326.18744-1-sarthakkukreti@chromium.org>
 <20230518223326.18744-2-sarthakkukreti@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230518223326.18744-2-sarthakkukreti@chromium.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v7 1/5] block: Don't invalidate pagecache for
 invalid falloc modes
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Bart Van Assche <bvanassche@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 18 2023 at  6:33P -0400,
Sarthak Kukreti <sarthakkukreti@chromium.org> wrote:

> Only call truncate_bdev_range() if the fallocate mode is
> supported. This fixes a bug where data in the pagecache
> could be invalidated if the fallocate() was called on the
> block device with an invalid mode.
> 
> Fixes: 25f4c41415e5 ("block: implement (some of) fallocate for block devices")
> Cc: stable@vger.kernel.org
> Reported-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@chromium.org>

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

Jens, this one is independent of the rest of the patchset and should
be ready to go upstream whenever you are able.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


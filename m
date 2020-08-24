Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C885024F3F6
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 10:26:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-94811142MHSk8JNky08B0Q-1; Mon, 24 Aug 2020 04:26:32 -0400
X-MC-Unique: 94811142MHSk8JNky08B0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8665201;
	Mon, 24 Aug 2020 08:26:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA6D50B54;
	Mon, 24 Aug 2020 08:26:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2026E181A06D;
	Mon, 24 Aug 2020 08:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O8QC62004151 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 04:26:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5FB949C2B; Mon, 24 Aug 2020 08:26:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C06C149B02
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A36538EE63F
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-o1p8r3AvPL-gVH-bBcFIRQ-1; Mon, 24 Aug 2020 04:26:07 -0400
X-MC-Unique: o1p8r3AvPL-gVH-bBcFIRQ-1
Received: by mail-pj1-f50.google.com with SMTP id ep8so3820888pjb.3
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 01:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	b=DX0Oxuy/erNu10KMEnBxF3Nx22EPnlavnHlTxgn3mDsJhBa0t57u7V2gKSIhMZvcw1
	umtD9WJ0P8fOkZPK1dPoYUaLQ2PJPdiwfimTipjNSQoQrXjZSl3VazTd6pgfC75W0Xsc
	kdxdRuiqt+1zmtahBfv5EbA+Gl/OeBBByrmjV0vOTR7YUAyTbfXKkfN46XvuCtQ6gSHE
	/Py4RAUZVyyC+k11WVkcQhv5FjXhRvsJ8cO9tZ7PsMjHXZPMwSeg/l2Umk8jBNSYxrjD
	ZzuB+3SpQEDO1yEkB6bmDTEoChyPG4m/aTQECeEZPxdrgILdvyzA2WhkLfWiTD4UAx4P
	T2nw==
X-Gm-Message-State: AOAM532Osvw+DiiowYz1oe2l4BIFUONnIG/VPF3zp9CG3nc0sVLHwyt5
	BcI/+nTDJs9CV1ivkToNNbI=
X-Google-Smtp-Source: ABdhPJwX8zNdc7jFiZkEPKaTs4v/SLmNt0Dx7a+U6l+UKbsqW6vA00T1N6wB/78LH4C1jRnOhLPIPg==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
	i9mr3156325plt.128.1598257566796; 
	Mon, 24 Aug 2020 01:26:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:cda6:bf68:c972:645d?
	([2601:647:4802:9070:cda6:bf68:c972:645d])
	by smtp.gmail.com with ESMTPSA id k5sm9452366pjq.5.2020.08.24.01.26.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Aug 2020 01:26:06 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200823091043.2600261-1-hch@lst.de>
	<20200823091043.2600261-3-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <4021e83a-b107-df28-2266-38648c769c9d@grimberg.me>
Date: Mon, 24 Aug 2020 01:26:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-3-hch@lst.de>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Xianting Tian <xianting_tian@126.com>, nbd@other.debian.org,
	Stefan Haberland <sth@linux.ibm.com>
Subject: Re: [dm-devel] [PATCH 2/3] block: fix locking for struct
 block_device size updates
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


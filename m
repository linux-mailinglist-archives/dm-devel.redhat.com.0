Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 46FA224F3F8
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 10:26:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-Eva-iXhZM-OVaE0Q2z6qFg-1; Mon, 24 Aug 2020 04:26:34 -0400
X-MC-Unique: Eva-iXhZM-OVaE0Q2z6qFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15178030DD;
	Mon, 24 Aug 2020 08:26:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFF57F463;
	Mon, 24 Aug 2020 08:26:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38C8D181A06C;
	Mon, 24 Aug 2020 08:26:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O8QF9h004168 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 04:26:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDE72100294B; Mon, 24 Aug 2020 08:26:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C96FE100320A
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B05628EE63D
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:15 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-0wEmPunGO5-n_jr_g77fIA-1; Mon, 24 Aug 2020 04:26:13 -0400
X-MC-Unique: 0wEmPunGO5-n_jr_g77fIA-1
Received: by mail-pf1-f178.google.com with SMTP id t9so268569pfq.8
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 01:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	b=LUX+gTL4Os05ehQTqyGV1WHOPMk4Up8eJrNssTgF2Kei+wSeUi7HBtGbSJfOD3or/c
	CwLuLGILpqoefO9y97RwcSZ2RSn6Z+6fUsACi8tt/Xcv/vF6NrwnrZHhnqH/LwNeRjbs
	6XKs0mrnGcWX0n9cb7gBpslEuDzdR2cdJIet15ltMxVKKWc7JdrpGzGhKJGV+LKjfBwq
	Kj/MlNtd5888KY+k9UGmr/aIsgip6Q2sxob/HqGf95MBQnjSeYgtH8HsDjm8KrrzwWrH
	Sw9Ru24OOBcfnid/xsBt16oj18Z2dBJ7+fdUZXAoOxeU4kSyQIvcnOUikdqZcXa+GE3i
	u0dQ==
X-Gm-Message-State: AOAM533V+4op3wE7WaXRd27sBiTMkhnBU8nKyASQap18f2efIlNLK6DW
	Estyp2AOdVDT4ZCcDn+ipYI=
X-Google-Smtp-Source: ABdhPJzXiZUVeS8YfUquyoWsC4hh0fRsUgPV5IJXXRp/HScfGTNVi+qxSJ9+/HWxEZO7m6q+OGBEBA==
X-Received: by 2002:a63:1417:: with SMTP id u23mr2850482pgl.289.1598257572669; 
	Mon, 24 Aug 2020 01:26:12 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:cda6:bf68:c972:645d?
	([2601:647:4802:9070:cda6:bf68:c972:645d])
	by smtp.gmail.com with ESMTPSA id
	h9sm11302035pfq.18.2020.08.24.01.26.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Aug 2020 01:26:12 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200823091043.2600261-1-hch@lst.de>
	<20200823091043.2600261-4-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <b5422c22-7f68-e2a5-ec53-e1457d11f3ad@grimberg.me>
Date: Mon, 24 Aug 2020 01:26:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-4-hch@lst.de>
Content-Language: en-US
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
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
	Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Xianting Tian <xianting_tian@126.com>, nbd@other.debian.org,
	Stefan Haberland <sth@linux.ibm.com>
Subject: Re: [dm-devel] [PATCH 3/3] nvme: don't call revalidate_disk from
 nvme_set_queue_dying
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


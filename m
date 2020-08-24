Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA1924F3F7
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 10:26:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-_erj4nCHOGa-dkSfGNtPVA-1; Mon, 24 Aug 2020 04:26:32 -0400
X-MC-Unique: _erj4nCHOGa-dkSfGNtPVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23DE8107465D;
	Mon, 24 Aug 2020 08:26:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 863805D9EF;
	Mon, 24 Aug 2020 08:26:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF571181A06C;
	Mon, 24 Aug 2020 08:26:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07O8Q7CM004134 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 04:26:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17AAC1110831; Mon, 24 Aug 2020 08:26:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 100D4100320A
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A440F8EE648
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 08:26:04 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-395-G4zg8ypMPu6nTNEfU8UpMg-1; Mon, 24 Aug 2020 04:26:01 -0400
X-MC-Unique: G4zg8ypMPu6nTNEfU8UpMg-1
Received: by mail-pl1-f194.google.com with SMTP id q3so2553649pls.11
	for <dm-devel@redhat.com>; Mon, 24 Aug 2020 01:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	b=X9AQmQIXV6EwHikcFdUzN6g/G6djYFYlOVKUWuoHASWsv5qEi6yAC9t4d8R+HngCOt
	j9hCy3TtH9zqJFXDYDI+tN//mdHdTLadWNVM/BO9psSBcDAZJkCvz57ZPkjWUJh7HB+B
	K3bA46EkXq3Ard+InOHUfN1UtduaeaMeYfzZpzjIhpfMrw5vwRJ/k63Xq7WG+DR13uY7
	pwzHdTuq8JBzCQwuAvjP6BEpI0W32w6rFk/qFTZ83O4cgBO1QKmxTwsXMKVzQOIdpTB2
	CCmhQzAyRtSCzuLcLZMeUx2Ev5hdTt2Cf+lK/y6YPxcKViBwASy4EteAxryROVFYP+b9
	dt8w==
X-Gm-Message-State: AOAM5316MH8qdIk9EKCOAZw4veixW6qvzwUwANwIImJ4awhiTw8d9x7k
	JYTHAAusnQi8k5cFLfJcPc4=
X-Google-Smtp-Source: ABdhPJxW0Sb1W31ji1xD5/tXnfUfq/0hDyEu38/TERhsoxJVdj23q3MPeALuQr+JGwJy3gfWJGZhFA==
X-Received: by 2002:a17:902:748c:: with SMTP id
	h12mr3050709pll.316.1598257560600; 
	Mon, 24 Aug 2020 01:26:00 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:cda6:bf68:c972:645d?
	([2601:647:4802:9070:cda6:bf68:c972:645d])
	by smtp.gmail.com with ESMTPSA id
	j5sm10776991pfg.80.2020.08.24.01.25.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 24 Aug 2020 01:26:00 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200823091043.2600261-1-hch@lst.de>
	<20200823091043.2600261-2-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <f31bb1a9-2f2c-2002-c7ce-29aa43feeafb@grimberg.me>
Date: Mon, 24 Aug 2020 01:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-2-hch@lst.de>
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
Subject: Re: [dm-devel] [PATCH 1/3] block: replace bd_set_size with
	bd_set_nr_sectors
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


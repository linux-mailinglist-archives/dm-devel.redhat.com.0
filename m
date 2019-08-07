Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6C851D3
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 19:15:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87D6530BA070;
	Wed,  7 Aug 2019 17:15:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04BCE5D9CD;
	Wed,  7 Aug 2019 17:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C39FC4EDA7;
	Wed,  7 Aug 2019 17:14:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77H8T6v026146 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 13:08:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76C82608AB; Wed,  7 Aug 2019 17:08:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7583608A5;
	Wed,  7 Aug 2019 17:08:22 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7588E806D1;
	Wed,  7 Aug 2019 17:08:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id m9so41585272pls.8;
	Wed, 07 Aug 2019 10:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Oc5/+mkxa26+9Mm7KHiWI56JJSv5It7fgiiyYBpofBE=;
	b=KZfcEB6bpvLMLcNDRpSdGW802UsfdVr0RrCuaHA0xAtReTKHzZqtZ6bRub9NnkJc34
	ilXf+4SOBA+zvDrrBEsZ3RPgZLQuUz16OHr+N7enFvZ17pOIrHK2nSzhzeIkztigWBY9
	ZA2EGWUO9rAN5dFVAGVBmwWN1hdELsa2RWcWiDionHF5jYlH1nPKZKHREls26UZBi1o+
	r3DUWoDKyaaY5E97rInNdU3QTZP050o5AYvpFLW5ZF/YLTaw6a+cZRT2+dmVkX+e8FVC
	kRR5mYFmht32ohdOuwmk1E0RZQQ0NtgOG/ygOjJHtMh+i52teMr6UqnBvjwosjub5wZg
	BMrQ==
X-Gm-Message-State: APjAAAWebBZFyA6bpXB2MPvyrk7a5Lh9UphELNCUofovYAk3Yk8Ec6h8
	sGerXOELTf+JnkT8V9GYWIef7eUr8fg=
X-Google-Smtp-Source: APXvYqyzqO1rvd6suKL+nQlLdxlj/fSykX9DcXRkJ3/EiPidZK2fMrUq8c3d//Dhcn+x9u9VhZFf1w==
X-Received: by 2002:a63:6d8d:: with SMTP id i135mr8536780pgc.303.1565197700171;
	Wed, 07 Aug 2019 10:08:20 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	f20sm106206005pgg.56.2019.08.07.10.08.18
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 10:08:19 -0700 (PDT)
To: Steffen Maier <maier@linux.ibm.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Ming Lei <ming.lei@redhat.com>
References: <20190807144948.28265-1-maier@linux.ibm.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <33a8afce-91a4-2a9d-d822-b12376fd0aa3@acm.org>
Date: Wed, 7 Aug 2019 10:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807144948.28265-1-maier@linux.ibm.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 07 Aug 2019 17:08:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 07 Aug 2019 17:08:21 +0000 (UTC) for IP:'209.85.214.193'
	DOMAIN:'mail-pl1-f193.google.com'
	HELO:'mail-pl1-f193.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.501  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.193 mail-pl1-f193.google.com 209.85.214.193
	mail-pl1-f193.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	Benjamin Block <bblock@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 0/2] scsi: core: regression fixes for request
	batching
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 07 Aug 2019 17:15:06 +0000 (UTC)

On 8/7/19 7:49 AM, Steffen Maier wrote:
> Hi James, Martin, Paolo, Ming,
> 
> multipathing with linux-next is broken since 20190723 in our CI.
> The patches fix a memleak and a severe dh/multipath functional regression.
> It would be nice if we could get them to 5.4/scsi-queue and also next.
 >
> I would have preferred if such a new feature had used its own
> new copy scsi_mq_ops_batching instead of changing the use case and
> semantics of the existing scsi_mq_ops, because this would likely
> cause less regressions for all the other users not using the new feature.

For both patches:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

BTW, these two patches fix several nvmeof-mp blktests regressions.

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

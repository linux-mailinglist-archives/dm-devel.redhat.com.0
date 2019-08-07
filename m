Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E6850E0
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 18:17:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F39A3078856;
	Wed,  7 Aug 2019 16:17:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C47275C21A;
	Wed,  7 Aug 2019 16:17:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C64772551C;
	Wed,  7 Aug 2019 16:17:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77GHJur018251 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 12:17:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AF4510016F3; Wed,  7 Aug 2019 16:17:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551A210016E9
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 16:17:17 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF98914AFAB
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 16:17:16 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id h8so43781169wrb.11
	for <dm-devel@redhat.com>; Wed, 07 Aug 2019 09:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rimRfJuK8em3IqAQSX92nJpilfNEDReWvsTTczdkS5I=;
	b=LSytJWxWExrqixFK3XK5Lbty+8DTXvD5KsCt1WHI8EZwPxpYmPKOvB8/GPh/6Xg9/I
	d+tWP5SHT1XPikp+wjc0d9VKuNfG3AWMTuNcHnSIgUkiRSTgjUlalmLKwXEU3tnzMi+q
	xryXj0led7uzSJiB2mGEnpZcqAdiPC9uq6yRFHS3udW4F2wB7gaRUvw5yMxKQhO0Eg4U
	kiY1WvbwRo7FJ0szIGVcLbj0Xa6EEfsLvBkvk0CvVQTUgzcgqiA74hYR9sgzcUdEd4b4
	8Tl8LWMI5u/v6zB1omErYEKP7QuOFB9wOyMi9IAHQLZIpCezyLKVJhqyK3af8mvIrPEh
	iQCA==
X-Gm-Message-State: APjAAAUGUJSPFy7wzFek0imjApTqNRrtxQOEMF/nXvZ3MTLyMaWTQX+N
	qjSxgmCB1qbxFy2AzFKYgy0oFd1lR860NiQvMFVg2ke4cXMveoLr6PLtxF2LP/3bsRg7ImjI+AI
	bNQUNIIIxeTQ9Y/8=
X-Received: by 2002:a5d:6606:: with SMTP id n6mr4280919wru.346.1565194635551; 
	Wed, 07 Aug 2019 09:17:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzazjaE77Dv6t5Ci6gVHioOlkD24Kr5pc/9tKvr9Hj/6DlaId/9yHdHHf/uwryHMeAikdLuZA==
X-Received: by 2002:a5d:6606:: with SMTP id n6mr4280889wru.346.1565194635282; 
	Wed, 07 Aug 2019 09:17:15 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	f10sm79635116wrs.22.2019.08.07.09.17.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 09:17:14 -0700 (PDT)
To: Steffen Maier <maier@linux.ibm.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
References: <20190807144948.28265-1-maier@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <700f3175-561a-c577-0cb7-3f9ae4d82db0@redhat.com>
Date: Wed, 7 Aug 2019 18:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807144948.28265-1-maier@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	Benjamin Block <bblock@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 07 Aug 2019 16:17:50 +0000 (UTC)

On 07/08/19 16:49, Steffen Maier wrote:
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
> 
> Steffen Maier (2):
>   scsi: core: fix missing .cleanup_rq for SCSI hosts without request
>     batching
>   scsi: core: fix dh and multipathing for SCSI hosts without request
>     batching
> 
>  drivers/scsi/scsi_lib.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

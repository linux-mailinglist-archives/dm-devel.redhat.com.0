Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C9663A6
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 04:05:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D54663082138;
	Fri, 12 Jul 2019 02:05:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6550560600;
	Fri, 12 Jul 2019 02:05:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C13441F40;
	Fri, 12 Jul 2019 02:05:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6C25Epp029684 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jul 2019 22:05:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C07A019C7F; Fri, 12 Jul 2019 02:05:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C4A19C67
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 02:05:10 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79C994E90E
	for <dm-devel@redhat.com>; Fri, 12 Jul 2019 02:05:09 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y15so3594635pfn.5
	for <dm-devel@redhat.com>; Thu, 11 Jul 2019 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=;
	b=ZRxqi0+uwfd/EXs2qS0gTss24yOP3a/nHPkifQtAcCm58w79HcGNu4EWv0NbxYawku
	AK1T8FHFgDxt/JZli9NM3Qa96jOu7ZgESJVqYzzOP6+/XCRrSitHAMIwLrcDeL5gyS3r
	xbLsolmvHSvDmwetd/a0I/ZoztCE7EXCtMp69KTXt1DSL0nQHHZiRJJnpuE007cl1B8S
	KwOInMzsJJTYqUCVuYlEzk3L1PRoDm0osjnYi427GGq8yc3jBvsYP/bBDi3/zip7I21/
	83G5Md5fG62b2qkvYzE0T4YCqEoqZ/kNEIeLFNgXTRiuL0SEPdzM8kda2EvGJfPUaMU6
	xYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zYr8UzDI7biFQnbTpSDLCT68yuvF3CA/Is+C1xTs8Kw=;
	b=PUW7WAXf8nQ/8LWY0p4ig/liZYolS+UDGlDAcXZjaOokQVwm9JJNe0Q4EsB9RPDurd
	xxYjiH2eGzcnkV30cEmQpM9kdezkGx6Mj6TLWPVncBGYl4qqfMB+KxjeknGsd5S/WSIo
	0OksQuTFbwNJ7TzPih1HX15OAZQ9hh6Me0ub6zlFChOJYflrBZkjiEWGSZof7mOKke8s
	Ebt2wCwJ+524FZ2Alw0g5KKst3AHP6v+n41hoTrBGZtamE+YyEBfOdDQbDynw2OVQH6p
	9mf0MFg5kgVIp7TXTwRibfvL7VifOpW4mPF54k44CEmMNShqXW3B3f8e7aTjfrXrPUsX
	xFMA==
X-Gm-Message-State: APjAAAWp+mCbUybnuA3B+22Wjfops9RAHppaNHzhKan5kRRdmeiumuXz
	Z/lrYcGLvfOZBT8RpiIcWFA=
X-Google-Smtp-Source: APXvYqwkoCxRxL6Tt/icdrxjvdW2QNNKuKiS5OHCXOb/WcWrbo2VzUJyQBzxCpp8z9PfHbsATpR+9g==
X-Received: by 2002:a65:6401:: with SMTP id a1mr7839009pgv.42.1562897108820;
	Thu, 11 Jul 2019 19:05:08 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
	by smtp.gmail.com with ESMTPSA id j15sm6611298pfe.3.2019.07.11.19.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jul 2019 19:05:06 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <cb26f686-ce7e-9d1a-4735-2375d65c0ea5@kernel.dk>
Date: Thu, 11 Jul 2019 20:05:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816BC7EC358F5785AEE1EA9E7F60@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 12 Jul 2019 02:05:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 12 Jul 2019 02:05:09 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 1.296 * (DKIM_SIGNED, DKIM_VALID, PDS_NO_HELO_DNS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 0/4] Fix zone revalidation memory
	allocation failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 12 Jul 2019 02:05:42 +0000 (UTC)

On 7/7/19 8:02 PM, Damien Le Moal wrote:
> On 2019/07/01 14:09, Damien Le Moal wrote:
>> This series addresses a recuring problem with zone revalidation
>> failures observed during extensive testing with memory constrained
>> system and device hot-plugging.
> 
> Jens, Martin,
> 
> Any comment regarding this series ?

LGTM, I'll queue it up for this release.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

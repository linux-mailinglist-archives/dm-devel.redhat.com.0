Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 300EBAB06E
	for <lists+dm-devel@lfdr.de>; Fri,  6 Sep 2019 03:54:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14202300BEB3;
	Fri,  6 Sep 2019 01:53:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66FE05D6A3;
	Fri,  6 Sep 2019 01:53:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78E2E4A486;
	Fri,  6 Sep 2019 01:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x861rJYG026514 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 21:53:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59F725C231; Fri,  6 Sep 2019 01:53:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 529905C1D4
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 01:53:16 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 314974D2E6
	for <dm-devel@redhat.com>; Fri,  6 Sep 2019 01:53:15 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y72so3179671pfb.12
	for <dm-devel@redhat.com>; Thu, 05 Sep 2019 18:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fuC7aNrIlu0FLWb5uxW6Ky6irB9KcFY2ncrOP9ADl4s=;
	b=fLnDmBU4gq7Er1C5Apm/3birxvKxf+Uu6oi9W55fvSI5ONTupwrw2Pvzpqw1MUoLcG
	vtwUFAKMivKiy64FfLznT8Bi2ksY6pmyaUhXclUrC8uo9yj97NIdAxnelRfWJi9iB44+
	jnZjNnsvcmuiv1YcCU1mxw/q3YjiSLTpZNUa9pVIb+WfyXVtQAQ7ioduuSvRW4cFCK30
	H6OfHXeG3cCEs6CBR9kEIu/pV/zXIGO2c3IDKtg/4bDSHHw3G6OSgqpVTM3WZavgSNY8
	dt7V/RIOIYbQq6KEOv+ME0I2AqeMQJAD7x04O0CW+r78jpvUpUpNyKhHxy5TiVMPlhun
	WZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fuC7aNrIlu0FLWb5uxW6Ky6irB9KcFY2ncrOP9ADl4s=;
	b=Btp2zTLe7E4mqW3sNjdxAni3j4gISjQprQg5FKRdHqz/XoNGjbG8sf+hg7SeiN7OOe
	9NTXWqetKzcu8uPa+UJTQgXduudcUJBb3GWMeh8L1oijqPcaouUKJaUwYOjVZZa3zHab
	/qyYswqAIIwfUucvJi+86EH1P+0AmCRlO/wvhz1XnKpDLA7X2NpeLrwZWqDnATUw0xcg
	tAoU+6eu1Ds0qxml3gr/MYLnat4HV+F8ynuwv2jvOf0VpxQeyj9lp+dcpuUdJayRuhL7
	zawvD9M4cbql59CEIJcAP5I+rVnwMdAduNqiSo+An7/ZSaMU+dku8wO+NF51Ss94Asld
	5bQw==
X-Gm-Message-State: APjAAAXg8UqT/kyDn8aBnkfZMUzBHO21UXV2DeDzrt4ShNIS6fgibJvO
	aGHWyS1rbe3NnXeW3g+acgjBCQ==
X-Google-Smtp-Source: APXvYqwR+QVXHh47vAMcFozkBntiZ58ZyB4KlT1RLDiLFzWrkFjIH/t9MkG95W7t0nL/6o+PPAih2g==
X-Received: by 2002:a17:90a:c70c:: with SMTP id
	o12mr5672683pjt.50.1567734794503; 
	Thu, 05 Sep 2019 18:53:14 -0700 (PDT)
Received: from [192.168.1.188] (66.29.164.166.static.utbb.net. [66.29.164.166])
	by smtp.gmail.com with ESMTPSA id
	m24sm5662690pfa.37.2019.09.05.18.53.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Sep 2019 18:53:13 -0700 (PDT)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, "Martin K . Petersen"
	<martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b0913603-5a3f-472d-1013-9b12835e77fe@kernel.dk>
Date: Thu, 5 Sep 2019 19:53:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 06 Sep 2019 01:53:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 06 Sep 2019 01:53:15 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.195 mail-pf1-f195.google.com 209.85.210.195
	mail-pf1-f195.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 0/7] Elevator cleanups and improvements
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 06 Sep 2019 01:54:01 +0000 (UTC)

On 9/5/19 3:51 AM, Damien Le Moal wrote:
> This patch series implements some cleanup of the elevator initialization
> code and introduces elevator features identification and device matching
> to enhance checks for elevator/device compatibility and fitness.
> 
> The first 2 patches of the series are simple cleanups which simplify
> elevator initialization for newly allocated device queues.
> 
> Patch 3 introduce elevator features, allowing a clean and extensible
> definition of devices and features that an elevator supports and match
> these against features required by a block device. With this, the sysfs
> elevator list for a device always shows only elevators matching the
> features that a particular device requires, with the exception of the
> none elevator which has no features but is always available for use
> with any device.
> 
> The first feature defined is for zoned block device sequential write
> constraint support through zone write locking which prevents the use of
> any elevator that does not support this feature with zoned devices.
> 
> The last 4 patches of this series rework the default elevator selection
> and initialization to allow for the elevator/device features matching
> to work, doing so addressing cases not currently well supported, namely,
> multi-queue zoned block devices.

Applied for 5.4, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 369752FBAA0
	for <lists+dm-devel@lfdr.de>; Tue, 19 Jan 2021 16:04:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-kYmUukGdOGuUnSM5vC3yrA-1; Tue, 19 Jan 2021 10:02:07 -0500
X-MC-Unique: kYmUukGdOGuUnSM5vC3yrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A2AB8122;
	Tue, 19 Jan 2021 15:01:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A80CF19CB0;
	Tue, 19 Jan 2021 15:01:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 130D518095FF;
	Tue, 19 Jan 2021 15:01:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JF1dwk025176 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 10:01:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AE311111C7E; Tue, 19 Jan 2021 15:01:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA7C110F73C
	for <dm-devel@redhat.com>; Tue, 19 Jan 2021 15:01:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBAF9811E98
	for <dm-devel@redhat.com>; Tue, 19 Jan 2021 15:01:34 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-YWTHUBheNeW4c7liOx3Xsw-1; Tue, 19 Jan 2021 10:01:05 -0500
X-MC-Unique: YWTHUBheNeW4c7liOx3Xsw-1
Received: by mail-qt1-f171.google.com with SMTP id d15so8409318qtw.12
	for <dm-devel@redhat.com>; Tue, 19 Jan 2021 07:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vn5Y0TrG3Ui6LBbbxvYnxl2nn5t3OepGIypDVq8V4YM=;
	b=M8nXeaxvwkvpwmiVtbgPLGR16rkyu1sM1S/L9Xu1Qg/tUQceRY9JUFCH+LXc8NWFoo
	xJGqNXEx4kCRvYZ5rAKt89XSc0Pe1bnkyU8m+yxcVINx+zjzi78q5a05oki4ZDkV97/J
	o6GZBtSB9Sik4MA/BmvEppESMyRKWuqcoRFydrAoXKzgBjq7XG50HE3HJ5Q/2jAp3/ij
	oTSGAZPzrb8aFJZja2Jwc3SQh35tIdQ47cMJ3YWnVYHb0SkXB4aSzfB1gbuk2gHpF303
	Qv7W+oFNwSCZ25kblmb20OVcEgfJp2/K0/0ujV6/SIAFGqjOPjIfGxO56N8Zt3EKmGRu
	Lsbg==
X-Gm-Message-State: AOAM531K0cEPeMPRHEnlaIUpUuk0cQE/lW5MES5IWYaYh1stnmpciWk+
	CXsMfzQEyJhVgUiOmXzKNJ2fIw==
X-Google-Smtp-Source: ABdhPJw9hzTjA0HJ6VQUPwDH9drSNqii0WFZZyVd4uYqJRq1euvOSRi+J16/swjVIXriRDU/RjWmOQ==
X-Received: by 2002:ac8:6f07:: with SMTP id g7mr4493450qtv.308.1611068464463; 
	Tue, 19 Jan 2021 07:01:04 -0800 (PST)
Received: from ?IPv6:2620:10d:c0a8:11d1::117a? ([2620:10d:c091:480::1:150f])
	by smtp.gmail.com with ESMTPSA id
	w91sm6339412qte.83.2021.01.19.07.01.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Jan 2021 07:01:03 -0800 (PST)
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <6eab7373-3c7f-fccf-8a6f-b02519258d23@toxicpanda.com>
Date: Tue, 19 Jan 2021 10:00:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com, efremov@linux.com,
	colyli@suse.de, tj@kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, bvanassche@acm.org, agruenba@redhat.com,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, song@kernel.org,
	philipp.reisner@linbit.com, jefflexu@linux.alibaba.com,
	rpeterso@redhat.com, lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com
Subject: Re: [dm-devel] [RFC PATCH 00/37] block: introduce bio_init_fields()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 1/19/21 12:05 AM, Chaitanya Kulkarni wrote:
> Hi,
> 
> This is a *compile only RFC* which adds a generic helper to initialize
> the various fields of the bio that is repeated all the places in
> file-systems, block layer, and drivers.
> 
> The new helper allows callers to initialize various members such as
> bdev, sector, private, end io callback, io priority, and write hints.
> 
> The objective of this RFC is to only start a discussion, this it not
> completely tested at all.

It would help to know what you're trying to accomplish here.  I'd echo Mike's 
comments about how it makes it annoying to update things in the future.  In 
addition, there's so many fields that I'm not going to remember what each one is 
without having to look it up, which makes it annoying to use and to review.  If 
it's simply to make sure fields are initialized then you could add debug sanity 
checks to submit_bio().  If it's to clean up duplication, well I'd argue that 
the duplication is much clearer than positional arguments in a giant function 
call.  If you are wanting to change a particular part of the bio to be 
initialized properly, like Dennis's work to make sure the bi_blkg was 
initialized at bi_bdev set time, then a more targeted patch series with a 
specific intent will be more useful and more successful.  Thanks,

Josef

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


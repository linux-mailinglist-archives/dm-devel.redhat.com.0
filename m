Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9D920CEEE
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 15:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593439042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yHtZ5HCo/mQeTLdBrmJF6lD45z2CTbPjJndpVN3vQJE=;
	b=G26qUQALIZNwECkObgxXP74wCa8tHdg/qqzpWZoubTqpKvjfoDCsm9iLhNPoC2X9hMhe+e
	eViNPR+SDhY+ZxUZ4HPZkrZtTj028K8KYSkCAP4xgmuthHDM4Pw4oQWI2MG+w2o9opXIf8
	m9l5gAiawp5wTWGY0zQL/YmCqpPBMQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-WblPZ9xIMOa9NYQQ-I46jQ-1; Mon, 29 Jun 2020 09:57:19 -0400
X-MC-Unique: WblPZ9xIMOa9NYQQ-I46jQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F956107ACCA;
	Mon, 29 Jun 2020 13:57:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 793489CFE8;
	Mon, 29 Jun 2020 13:57:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F70887893;
	Mon, 29 Jun 2020 13:57:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TDuqj6013432 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 09:56:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17C8E2156A4E; Mon, 29 Jun 2020 13:56:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12DCE2156A53
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:56:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1DAB8007A4
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 13:56:49 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-CcTX8CJzPh6I6H6FcmSpLA-1; Mon, 29 Jun 2020 09:56:46 -0400
X-MC-Unique: CcTX8CJzPh6I6H6FcmSpLA-1
Received: by mail-qt1-f178.google.com with SMTP id x62so12866767qtd.3
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 06:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=LrEjvuOin918PAofPsAgLqEkYaBJUx4P898a1Pb6YYM=;
	b=Jn6GG8Q8q3c1AGNkYkEOqRaXhAFah0h/UlYoxRhFDwIt5EZan3siBNj8Y8IXaOACzJ
	tF4jfUBHDqX/faPo60VB450+dfEivuyp3giQlJVgSWUENijmudlcGs++2GNSfL8qF5YX
	ehz2tamcNAU5kIeBA/TmJcDNsbbv+PE1czP7a+FeRMCzPcdk4Ywc8byrVJJHbwM6V3AG
	hqs0odqjH/cwl7otTtFRKt3OXHCUhvuwNZ2SBFC6WToaaWWZL1EA4f65EZFCRfV7IYAD
	yRen0r3+8elDj8Dh1WyyiUaVzJ67DXSu1c0M4ueYZ9lG0kWEkNibhi7oo96SQb0kGmLA
	IwtA==
X-Gm-Message-State: AOAM532qyGOPeCr/722RYtyTAJv776ZkQ9J66+hVjd0VYvAqDEz39+DK
	IjIzQRHaxVh93XO0SBYFAvM=
X-Google-Smtp-Source: ABdhPJzVW9rKTRYYquAhom+ajTl8S5hOknpLXTSQ3LijLTqXn91ePIJzb9xDmTsfRnCr1uRKtQrd2Q==
X-Received: by 2002:ac8:154:: with SMTP id f20mr14767600qtg.331.1593439005608; 
	Mon, 29 Jun 2020 06:56:45 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:26be])
	by smtp.gmail.com with ESMTPSA id
	f22sm19861844qko.89.2020.06.29.06.56.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jun 2020 06:56:44 -0700 (PDT)
Date: Mon, 29 Jun 2020 09:56:43 -0400
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200629135643.GA233973@mtj.thefacebook.com>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] drive-by blk-cgroup cleanups
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jun 27, 2020 at 09:31:45AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> while looking into another "project" I ended up wading through the
> blkcq code for research and found a bunch of lose ends.  So here is
> a bunch of drive-by cleanups for the code.

The whole series looks great to me.

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FB49E818
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jan 2022 17:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643302421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bi1jDGk5Oolvd5+1NAnhk5yxxGSghfmVYHG4suC9V5E=;
	b=QUXbUEb3ay1SQOIlWkR1WyGzRy4orPvXh8KAjVuaH8fkwdfkrrm0nNqIPfcw3pH/xahtGL
	42/tuPrQGbcfVgDV7xlmeNIlCQHbfv9+k84Nxsydon5rAIFHwCtr+L2We64YCp1q9zQOnB
	GyUCVTi3AXVfquYmWOLOFujo01a0Z8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-WV8Vlil7NhuDLSJTpmziZg-1; Thu, 27 Jan 2022 11:53:37 -0500
X-MC-Unique: WV8Vlil7NhuDLSJTpmziZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072B084DA41;
	Thu, 27 Jan 2022 16:53:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E094C74E89;
	Thu, 27 Jan 2022 16:53:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 099FA1809CB8;
	Thu, 27 Jan 2022 16:53:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20RGqtAa018736 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 11:52:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4F8D614582F9; Thu, 27 Jan 2022 16:52:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B73614582FA
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 16:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3273928EB2C4
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 16:52:55 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
	[209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-16-NsgEeC8_PYevo0bub8KUVg-1; Thu, 27 Jan 2022 11:52:53 -0500
X-MC-Unique: NsgEeC8_PYevo0bub8KUVg-1
Received: by mail-qv1-f69.google.com with SMTP id
	kc19-20020a056214411300b00422b7cdea6eso3644251qvb.19
	for <dm-devel@redhat.com>; Thu, 27 Jan 2022 08:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=AGOKQqcuQhkDwTPU+rhG3/lUwVIbdjyWIj81munfXW0=;
	b=ma/YTtdHUwZL2IBM/151auJpUD6FSqOG4/gTEOvj5We72ZQwDvMjL6Pl61KPDj8GSp
	VplBVRkWFp9ZT7AkMswNSROabZGFgL/1+iRXgoz6WfLW2pVYpXdiQ6p7/QOc9ZHaABYq
	7OU9cB9900qWWG7zC5vbF8+1AVxs5Dkote3pLb7THpcKTjV70cj22z09auPADTGRn2G5
	llTvAgIuWxMiLQtiuWJliQ1f1/UQovMHTr+X1rnHvc8Yp9Q6lV5N5m/kNhs1PiVXp0gl
	c+VDN+JtoqD4opny8z99uqYWeju6oysfVmYH3OabFj9JDq8D0wOYu94K9W15+2/ZOZa3
	z+Gw==
X-Gm-Message-State: AOAM533wXxteUfAV3V6gq3uRblZvn3Hyu7TfWiWzqwWLAUNKJOArE0ZF
	yoxOliG2/G8tosCoZ2pPth+jRFOcqJvNnILRaqwTSITrZVx+rz+p36jZJ5NGZXP7AMh1uSYbODc
	QGiJj36Oupjay5w==
X-Received: by 2002:a0c:fa09:: with SMTP id q9mr4322355qvn.21.1643302373427;
	Thu, 27 Jan 2022 08:52:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2rtqqWw8vSSkq/pAGCHoYHXJ1BiURlAQlul/eODmSBNf8OGMbqxmxG8mMS7PpEMI9YH9jUw==
X-Received: by 2002:a0c:fa09:: with SMTP id q9mr4322338qvn.21.1643302373224;
	Thu, 27 Jan 2022 08:52:53 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id y15sm826432qtx.28.2022.01.27.08.52.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 08:52:52 -0800 (PST)
Date: Thu, 27 Jan 2022 11:52:51 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLN4/2bYe4hebCy@redhat.com>
References: <20220127063546.1314111-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220127063546.1314111-1-hch@lst.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [dm-devel] improve the bio cloning interface
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 27 2022 at  1:35P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Hi Jens,
> 
> this series changes the bio cloning interface to match the rest changes
> to the bio allocation interface and passes the block_device and operation
> to the cloning helpers.  In addition it renames the cloning helpers to
> be more descriptive.
> 
> To get there it requires a bit of refactoring in the device mapper code.

I'd like to take a closer look, do you happen to have this series
available in a git branch?

The changes generally look fine.  Any chance you could forecast what
you're planning for follow-on changes?

Or is it best to just wait for you to produce those follow-on changes?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


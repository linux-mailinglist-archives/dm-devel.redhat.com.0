Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 67A52216FAC
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 17:07:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-OxyVU_0lPciMEi00aXYF3A-1; Tue, 07 Jul 2020 11:07:00 -0400
X-MC-Unique: OxyVU_0lPciMEi00aXYF3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E261D8015F6;
	Tue,  7 Jul 2020 15:06:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18196797E4;
	Tue,  7 Jul 2020 15:06:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35DAC1809554;
	Tue,  7 Jul 2020 15:06:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067F6nKl029873 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 11:06:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1240A53C4; Tue,  7 Jul 2020 15:06:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE7B49C1A
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 15:06:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152BB108C26C
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 15:06:46 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-63--FrpO-NVMGyHisbhsA1AzQ-1; Tue, 07 Jul 2020 11:06:44 -0400
X-MC-Unique: -FrpO-NVMGyHisbhsA1AzQ-1
Received: by mail-il1-f196.google.com with SMTP id e18so25556612ilr.7
	for <dm-devel@redhat.com>; Tue, 07 Jul 2020 08:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2XASVM4AqY31qIAgIY2OK3nO95mUNITex7KrDrl4aN8=;
	b=rft1jQTu1qCIku0fXAAkiLNYQ174DilSrwRpJOxiutqm9M0ybjjg5quZa7RfbkiGJb
	XPCt+DeodHTeDt+IdYJJXokY0RKb3IuFk+2FhHn8dblY5zzKiLlxfBtbe7TB05CObRBO
	x/e4jXoxGZDLlCksRINOjGgbD3FXr2mnLeHv+tPBqecpBc49wqG0WKcwDJY/7fVqQjFL
	84zfamV6ZT/PAy7mLpwFvRYx2ZtlQOZe1GuIO6l/GNtoEPmZLdjbi241Jcf1kq3rKJaf
	UYBp7tKZZFMhY9IMggw9yI3dAYmSLf7bS6KS5ls1bkH2s5FYBYd1YRYPKG/DgZeyHWgd
	QppA==
X-Gm-Message-State: AOAM5300aA4OrnIF0Uo3KrUtY+xPSaCAa8zPCk4XbEU3EtWNYOpxgtCj
	R5Zg6MggzHh2vbHkbkXJotQMeQ==
X-Google-Smtp-Source: ABdhPJzRlJE3eTlzkgRAxz2LN+fUaR3t68qtI+trr22emrpJiqK3il2bLM/g1joJmGIus/cnlN+rMQ==
X-Received: by 2002:a92:c502:: with SMTP id r2mr37872563ilg.78.1594134403170; 
	Tue, 07 Jul 2020 08:06:43 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	v3sm13314560ili.12.2020.07.07.08.06.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 07 Jul 2020 08:06:42 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org
References: <20200707150433.39480-1-snitzer@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <dc5f15f0-db7f-eb1b-f504-d29ec5ef8a7e@kernel.dk>
Date: Tue, 7 Jul 2020 09:06:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707150433.39480-1-snitzer@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH] blk-mq: consider non-idle request as
 "inflight" in blk_mq_rq_inflight()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/7/20 9:04 AM, Mike Snitzer wrote:
> From: Ming Lei <ming.lei@redhat.com>
> 
> dm-multipath is the only user of blk_mq_queue_inflight().  When
> dm-multipath calls blk_mq_queue_inflight() to check if it has
> outstanding IO it can get a false negative.  The reason for this is
> blk_mq_rq_inflight() doesn't consider requests that are no longer
> MQ_RQ_IN_FLIGHT but that are now MQ_RQ_COMPLETE (->complete isn't
> called or finished yet) as "inflight".
> 
> This causes request-based dm-multipath's dm_wait_for_completion() to
> return before all outstanding dm-multipath requests have actually
> completed.  This breaks DM multipath's suspend functionality because
> blk-mq requests complete after DM's suspend has finished -- which
> shouldn't happen.
> 
> Fix this by considering any request not in the MQ_RQ_IDLE state
> (so either MQ_RQ_COMPLETE or MQ_RQ_IN_FLIGHT) as "inflight" in
> blk_mq_rq_inflight().

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


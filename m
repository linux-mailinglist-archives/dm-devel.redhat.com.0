Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4C2230E37
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 17:43:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-8WD1QbZONmqhfX4w803c3A-1; Tue, 28 Jul 2020 11:43:16 -0400
X-MC-Unique: 8WD1QbZONmqhfX4w803c3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60E8F107ACCA;
	Tue, 28 Jul 2020 15:43:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5105B6932A;
	Tue, 28 Jul 2020 15:43:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B62A91809547;
	Tue, 28 Jul 2020 15:42:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SFfd13030295 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 11:41:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 405518A4C9; Tue, 28 Jul 2020 15:41:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3251A7AF9
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 15:41:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94ACA1006842
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 15:41:36 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
	[209.85.166.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-6yG3twk6OXSCD_ADEGKADQ-1; Tue, 28 Jul 2020 11:41:31 -0400
X-MC-Unique: 6yG3twk6OXSCD_ADEGKADQ-1
Received: by mail-il1-f175.google.com with SMTP id l17so6352520ilq.13
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 08:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vSWx1/Sr/gJvV92Fd2QuTQjvx6hegEt2EdSzZRTJZXM=;
	b=PFSlOgJ0a2UKeyJcOaGO2s9AUBPKKLFmccxMp1U5JQQ030DEDojbAxdODZcd/wBevZ
	k8nQ7OEeB3tKowg2uXPrJXvWoO7mLGG4b2mGV82EfPgIGfihbp4pExjKPUzgFkEYqFj/
	JuUNjMeQciJxMBYyCGk6bwLHjMLiaKEGhY/Hk8T1h8QhIBCYQM1VsXoO6h3quu/2tJwT
	Ss+ZN/uKF8uXTeZNWMaVMAVl80X8s1VPCYty+Jy+YA/DovBg4DBEFRHWdwiV35nQP8x1
	/d1a7Hq6W4BjHZUQJPKwc6uy7ydlqL/XlhkVJXV/YxMjVCpFp3JIidhp7jbKEwiKYK5K
	iFHg==
X-Gm-Message-State: AOAM531bn0ZJji+oEYZHfzQ+1rSx9YOqljpLxPIaps/npCxHf+N44VV1
	0p1NpbQQOrVFc7LFiiNJNKzYaA==
X-Google-Smtp-Source: ABdhPJyDr3/VSL/Sd0AZTRTnDaDXbKtAPJuxtlG2XtO6yQjepAU3x+9xL+YVZgu/NKlxbtyZpuHMhw==
X-Received: by 2002:a05:6e02:c6b:: with SMTP id
	f11mr411495ilj.272.1595950890232; 
	Tue, 28 Jul 2020 08:41:30 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id u6sm2827959ilk.13.2020.07.28.08.41.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 28 Jul 2020 08:41:29 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Date: Tue, 28 Jul 2020 09:41:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] bdi cleanups v3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/24/20 1:32 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains a bunch of different BDI cleanups.  The biggest item
> is to isolate block drivers from the BDI in preparation of changing the
> lifetime of the block device BDI in a follow up series.

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


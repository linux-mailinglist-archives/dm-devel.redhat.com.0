Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C70086EC600
	for <lists+dm-devel@lfdr.de>; Mon, 24 Apr 2023 08:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682316255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0tB5i7ko95zxPxuZnORawNJI8beraMrPF57S2FQN1F8=;
	b=TwB2xtA3YN2CALDplLURrjb23EGktKrIzhhw/RGKN3yM/NR5zbZGZKP76Hsaez0v89GlWX
	vClFm5bGQcwmwY5hLjqMoZCjOLX5UBcY1CiGzKj45bMaFPMJXnGro7BekWqc8qiZ7HYk3D
	t19P5bz1Jxaj6iEgEVAJx8zKeDNj1Mo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-O2FSvfyEPP6IicdCAlYhNQ-1; Mon, 24 Apr 2023 02:04:13 -0400
X-MC-Unique: O2FSvfyEPP6IicdCAlYhNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28CD9857FB4;
	Mon, 24 Apr 2023 06:04:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDF2C4E3C5;
	Mon, 24 Apr 2023 06:04:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CAA81946A47;
	Mon, 24 Apr 2023 06:04:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 787BB1946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 24 Apr 2023 02:36:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 49A37492B0F; Mon, 24 Apr 2023 02:36:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41545492B03
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 02:36:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BE863814588
 for <dm-devel@redhat.com>; Mon, 24 Apr 2023 02:36:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-BvP3K16rN-6kKcTISaHTAQ-1; Sun, 23 Apr 2023 22:36:31 -0400
X-MC-Unique: BvP3K16rN-6kKcTISaHTAQ-1
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-63b620188aeso4983117b3a.0
 for <dm-devel@redhat.com>; Sun, 23 Apr 2023 19:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682303790; x=1684895790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Er9IodKAhu5Xy/24MmuM3ISnj8SFsqKhcDcV85YYtd4=;
 b=ePFu2FOUWAAb4n+ToLx9FIy8AJ6ke62sFwTgPJSUsfeUM/roVLAlAaqqiPMUr3aa6n
 YoxMMg32xY+YJixv2T2nC3zsPtnredgFgkHTloU7aqwTAZO70gjw+OpafUUfQ11ARznX
 W1EOC+DwVvS56zF6tQJ+rimefErRRgWceXW+IcV/z3mCJ3/RLSdtqS0BjNAlpYpCYWnG
 KM3G7YdR+1r+6NHJIC2vz5qb337JEIlAkTDGonUEkJ3iknfUJx6WroE2JABH9IMnp0wn
 hqFkOyneaVGvam3hsyNvXBhx+XbrZg2RkYLr/H/PJHi3GxpGqLX/5EDZ4TX4m5b+uSpN
 M0iA==
X-Gm-Message-State: AAQBX9c2kDvXjI2H8BdUYgwaUxckQmuWJou3m+sD9HoINy/GW9Un9IV0
 Sqvj5uNLFZJYLsobdGxnvPnj0k/a1nOzVhlK2ow=
X-Google-Smtp-Source: AKy350a438RODTsIQbvbOZb4mhoGqhZ1pvzPivBPJ5Ra5hjJQnsR6/IRQqkIVQmM+kaUu2d3rd1IMA==
X-Received: by 2002:a05:6a00:2406:b0:63d:38aa:5617 with SMTP id
 z6-20020a056a00240600b0063d38aa5617mr12656579pfh.6.1682303790512; 
 Sun, 23 Apr 2023 19:36:30 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
 by smtp.gmail.com with ESMTPSA id
 h8-20020aa786c8000000b0063b8279d3aasm6183422pfo.159.2023.04.23.19.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 19:36:29 -0700 (PDT)
Date: Mon, 24 Apr 2023 11:36:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230424023623.GC1496740@google.com>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
 <20230421195807.2804512-6-mcgrof@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230421195807.2804512-6-mcgrof@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 24 Apr 2023 06:04:00 +0000
Subject: Re: [dm-devel] [PATCH 5/5] zram: use generic PAGE_SECTORS and
 PAGE_SECTORS_SHIFT
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
 dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
 christoph.boehmwalder@linbit.com, willy@infradead.org, hch@infradead.org,
 p.raghav@samsung.com, senozhatsky@chromium.org, snitzer@kernel.org,
 linux-block@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk,
 da.gomez@samsung.com, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 minchan@kernel.org, patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 lars.ellenberg@linbit.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: chromium.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On (23/04/21 12:58), Luis Chamberlain wrote:
> 
> Instead of re-defining the already existing constants use the provided ones:
> 
> So replace:
> 
>  o SECTORS_PER_PAGE_SHIFT with PAGE_SECTORS_SHIFT
>  o SECTORS_PER_PAGE       with PAGE_SECTORS
> 
> This produces no functional changes.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


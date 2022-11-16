Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6862CDBA
	for <lists+dm-devel@lfdr.de>; Wed, 16 Nov 2022 23:32:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668637960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yeYMMnLSc1jUlW9sVYdo53MXgl+HYGa+R5lsv1TSbcs=;
	b=XZ2r83EgQm+ZzWneeXWc8YMyvlyUDj59XBI0aHGH1YVjSILx8EZZJ4LKpWg9SZs6Pux1pm
	Eu5LL30A+NeQ3I6/Dtqzd+A3PepG+93A1/kf7LJfhz9RDQu83mvt0qh1Ff/gQMeZiFkPpJ
	XHtrON+YPtuqYtxXU3keH8Ma4JtsncM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-Vv-HQKG1MM-J9FdXMjVSmg-1; Wed, 16 Nov 2022 17:32:38 -0500
X-MC-Unique: Vv-HQKG1MM-J9FdXMjVSmg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0484B811E7A;
	Wed, 16 Nov 2022 22:32:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA465492B04;
	Wed, 16 Nov 2022 22:32:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF1E91946A41;
	Wed, 16 Nov 2022 22:32:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5395919465A2
 for <dm-devel@listman.corp.redhat.com>; Wed, 16 Nov 2022 22:20:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45C4A2166B30; Wed, 16 Nov 2022 22:20:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3962166B29
 for <dm-devel@redhat.com>; Wed, 16 Nov 2022 22:20:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D9EC811E75
 for <dm-devel@redhat.com>; Wed, 16 Nov 2022 22:20:29 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-ttIlV8KoPgKeC6NpzWYZ_w-1; Wed, 16 Nov 2022 17:20:27 -0500
X-MC-Unique: ttIlV8KoPgKeC6NpzWYZ_w-1
Received: by mail-pj1-f48.google.com with SMTP id k5so17773153pjo.5
 for <dm-devel@redhat.com>; Wed, 16 Nov 2022 14:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEjKgjdJfrVf8HtFsOf1hWq1pz83a0clNltcH86fMuM=;
 b=Tu7OOpUba3R8rbYuUMK6kXEtEZuPYKZjErxWKI8TMXUkL6WbTp0njhxCGuDFWfflKT
 a/dWkIl2ZWRjwqrtmInBa5eBiq6kZMZ4oz582NPrp6RruD6t/knMWnbpSncu1x7ew0eJ
 tJzpFCf1DtcrHVsplH54VesPsmMBNy8a1YJwXtJlogxoF4nk1PFbz4lvnF+0y14zdi6p
 yNcAAYk/M67aw3QuC7D70JchcfYGJP+BhxNLqMk7GVa5Fn/7h7He0N2G9eCDtjjTF1xZ
 hlWU87AozozviCZ1VPnRJxiZdLHU3H4nU+9wMGjRSrt6SstRezALRRaCeyqqER3oC2TF
 T67Q==
X-Gm-Message-State: ANoB5pkZjiQ+X+q2HN9CIxnfv87qqDECcQYv7PjAgZvSczAg8GLLQBzP
 t6cNf/vPOn4AwsakwMK0PaxzmA==
X-Google-Smtp-Source: AA0mqf7WZxQxdqgnIyWTf+4IzjNaKNBlVf2HQMB+vbxL9rzQ67Grpka8LdSFqFoq7/nQ08zWSufZRA==
X-Received: by 2002:a17:90b:4b42:b0:20a:e38c:8c5f with SMTP id
 mi2-20020a17090b4b4200b0020ae38c8c5fmr5704988pjb.217.1668637225806; 
 Wed, 16 Nov 2022 14:20:25 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 e24-20020a63f558000000b00470275c8d6dsm10011228pgk.10.2022.11.16.14.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 14:20:25 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Yu Kuai <yukuai1@huaweicloud.com>, dm-devel@redhat.com, agk@redhat.com,
 snitzer@kernel.org, hch@lst.de
In-Reply-To: <20221115141054.1051801-1-yukuai1@huaweicloud.com>
References: <20221115141054.1051801-1-yukuai1@huaweicloud.com>
Message-Id: <166863722483.6643.3538275832445983293.b4-ty@kernel.dk>
Date: Wed, 16 Nov 2022 15:20:24 -0700
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH v3 00/10] fix delayed holder tracking
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
Cc: linux-block@vger.kernel.org, yukuai3@huawei.com,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 15 Nov 2022 22:10:44 +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Hi all,
> 
> this series tries to fix the delayed holder tracking that is only used by
> dm by moving it into dm, where we can track the lifetimes much better.
> v2 is from Christoph, here I send v3 with some additional fixes.
> 
> [...]

Applied, thanks!

[01/10] block: clear ->slave_dir when dropping the main slave_dir reference
        commit: d90db3b1c8676bc88b4309c5a571333de2263b8e
[02/10] dm: remove free_table_devices
        commit: 992ec6a92ac315d3301353ff3beb818fcc34e4e4
[03/10] dm: cleanup open_table_device
        commit: b9a785d2dc6567b2fd9fc60057a6a945a276927a
[04/10] dm: cleanup close_table_device
        commit: 7b5865831c1003122f737df5e16adaa583f1a595
[05/10] dm: make sure create and remove dm device won't race with open and close table
        commit: d563792c8933a810d28ce0f2831f0726c2b15a31
[06/10] dm: track per-add_disk holder relations in DM
        commit: 1a581b72169968f4154b5793828f3bc28b258b35
[07/10] block: remove delayed holder registration
        commit: 7abc077788363ac7194aefd355306f8e974feff7
[08/10] block: fix use after free for bd_holder_dir
        commit: 62f535e1f061b4c2cc76061b6b59af9f9335ee34
[09/10] block: store the holder kobject in bd_holder_disk
        commit: 3b3449c1e6c3fe19f62607ff4f353f8bb82d5c4e
[10/10] block: don't allow a disk link holder to itself
        commit: 077a4033541fc96fb0a955985aab7d1f353da831

Best regards,
-- 
Jens Axboe


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


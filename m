Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DF5AA421
	for <lists+dm-devel@lfdr.de>; Fri,  2 Sep 2022 02:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662077803;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zxiAP+q0/b9IXcur/CNRx+6c09v/M40c31aFgmy8ZCM=;
	b=RHUAjXuTvFJ5pkz6J1M08Q8+G7O6PJjDPZad7jZ5ubsCybF/cSK4oicmU7sGb14auOKzdu
	ARZgD4OgW/cE2+QBp/Jn2oD5MerAemH29CaE9TFAEIAk3zXbug3+5Na2rPsSbF16+OtpZK
	hPTD5hHB847EA3v/1gg6rX1Y/4Bx/MI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-0gSN48IeNoulR0b8MYWmZA-1; Thu, 01 Sep 2022 20:16:40 -0400
X-MC-Unique: 0gSN48IeNoulR0b8MYWmZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7E2185A794;
	Fri,  2 Sep 2022 00:16:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4360C401473;
	Fri,  2 Sep 2022 00:16:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0ED121940343;
	Fri,  2 Sep 2022 00:16:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 572761946A5E
 for <dm-devel@listman.corp.redhat.com>; Fri,  2 Sep 2022 00:16:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 32CDD400EA8F; Fri,  2 Sep 2022 00:16:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F8FA4011A3E
 for <dm-devel@redhat.com>; Fri,  2 Sep 2022 00:16:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 166F6185A7A4
 for <dm-devel@redhat.com>; Fri,  2 Sep 2022 00:16:29 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-hgz9y6XLML2cWRo2synJZw-1; Thu, 01 Sep 2022 20:16:27 -0400
X-MC-Unique: hgz9y6XLML2cWRo2synJZw-1
Received: by mail-qv1-f70.google.com with SMTP id
 og5-20020a056214428500b00496b5246db5so294714qvb.10
 for <dm-devel@redhat.com>; Thu, 01 Sep 2022 17:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=BJXkmWS8fs1OJFQDlt9uEZ42yIaPYlfbQFXo4qcCOho=;
 b=gMyzKnahU+h4LW4Y1CrVDS7E+ZMJzqL/cECfvqfryWwrm369D8OQ/cu1Pp7Z94c+HV
 i9qsSy8zXuYDDh+8LiUBbKGmTDkzkOkOIYx3uAIiiyujt/HQxmw6sHCCa+S19JRkfdQW
 iX2QB1NaUWGoA7dt811rptD+TcxuCOaRTjBcIr4Q7VX/rBn9Ko5eqFFvwKXI+yB3W36E
 tWqCHkkrXQGlqwfhsykqMUzQXC13ETvSw9wxU7sBmrHBnvRIx9zrncNqUXoq7gVCxbrS
 OpEzv+VRnE08AyN+idk9nG8f/Ox0mD6CkL08Kc9AzP4yyJEhe+bvzY5oyWc+T7M8EKdN
 3Z1Q==
X-Gm-Message-State: ACgBeo1PUpUOHnmlR8ysyRZK6phPFvY1ZpbjH0Z49Uk/FDEkl9o2nf2V
 ZordDPy5mYX4gJuUuAOgeKYVyi/EV7JjZ7pdWZMz7oFo9OottBpjhuuhUxx3pIKy8l6h59U8xor
 Wrb0muV4oSW5Pkw==
X-Received: by 2002:ac8:5a09:0:b0:344:69c7:d405 with SMTP id
 n9-20020ac85a09000000b0034469c7d405mr26543391qta.158.1662077787571; 
 Thu, 01 Sep 2022 17:16:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xfpUx4j6Jfald4N7jmwOFuH/AS+dP1NbvYV//P7CHrd0ECl3dDoJBwQdLGwkp4TF0/VDNjg==
X-Received: by 2002:ac8:5a09:0:b0:344:69c7:d405 with SMTP id
 n9-20020ac85a09000000b0034469c7d405mr26543381qta.158.1662077787384; 
 Thu, 01 Sep 2022 17:16:27 -0700 (PDT)
Received: from localhost (pool-68-160-173-162.bstnma.fios.verizon.net.
 [68.160.173.162]) by smtp.gmail.com with ESMTPSA id
 i7-20020a05620a404700b006b5cc25535fsm297002qko.99.2022.09.01.17.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 17:16:26 -0700 (PDT)
Date: Thu, 1 Sep 2022 20:16:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YxFLWcY/xSqyqORO@redhat.com>
References: <20220823121859.163903-1-p.raghav@samsung.com>
 <CGME20220823121909eucas1p113c0c29f7e28d0ee3e1161f7da243baf@eucas1p1.samsung.com>
 <20220823121859.163903-9-p.raghav@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20220823121859.163903-9-p.raghav@samsung.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v12 08/13] dm-zoned: ensure only power of 2
 zone sizes are allowed
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
Cc: axboe@kernel.dk, bvanassche@acm.org, pankydev8@gmail.com,
 Johannes.Thumshirn@wdc.com, damien.lemoal@opensource.wdc.com,
 snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, matias.bjorling@wdc.com, gost.dev@samsung.com,
 jaegeuk@kernel.org, hch@lst.de, agk@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 23 2022 at  8:18P -0400,
Pankaj Raghav <p.raghav@samsung.com> wrote:

> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> dm-zoned relies on the assumption that the zone size is a
> power-of-2(po2) and the zone capacity is same as the zone size.
> 
> Ensure only po2 devices can be used as dm-zoned target until a native
> support for zoned devices with non-po2 zone size is added.
> 
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


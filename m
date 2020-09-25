Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 54C38278AC2
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 16:19:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-O9H-Tg2yP7-Mmf8__4WAlA-1; Fri, 25 Sep 2020 10:19:45 -0400
X-MC-Unique: O9H-Tg2yP7-Mmf8__4WAlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C3A1DDEB;
	Fri, 25 Sep 2020 14:19:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA665D9DC;
	Fri, 25 Sep 2020 14:19:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D75144A5E;
	Fri, 25 Sep 2020 14:19:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PEJGRd014462 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 10:19:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B48FA1010248; Fri, 25 Sep 2020 14:19:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B014B109EF6C
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:19:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D04718AE94A
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:19:14 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-hIFjJ1TuN5yskLgorOOPtw-1; Fri, 25 Sep 2020 10:19:11 -0400
X-MC-Unique: hIFjJ1TuN5yskLgorOOPtw-1
Received: by mail-pg1-f181.google.com with SMTP id l71so2711732pge.4
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 07:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Izvn14aXCOd8rlHi8gt8/prckjwG/92/E8+p6vMMqzM=;
	b=uhBLXjEErK53ioxyBbS5eurG82HStblayuTnRdlINFvpWqMkLcHBlV1eWyLCm71fkG
	TrzvRuXmM141rt6dnLly2fakWgYl2Mh6G+1K8MO85EESiLCp1265gfzpcWkxUj4M0YBa
	Z9FdjkfZZcw7dx7gSj0GBNd3jimyKeaNDwHtOfJY7/XFQvNoqElDMSMhC2MDGU5zsk2p
	zgZZL2PwiE4zQXO5+/itdV3K8a5k9WmVFtg8WwWGm5ObWdJSosy4a9C/4i8mo4t1EQ1y
	NOia9iACQXiKX/uAFMLv+rQcqmOUTLt1fOZC0+YD07mPjhGPQLq/QyQsLU+sOA7+qXNC
	E4Lg==
X-Gm-Message-State: AOAM533nb+fwy1C/gk+m4ckJuG6djRaKG59WRfaTac+Hxj4T89YKfCtS
	gTDL3WvdxolS9Et0PDELjGqYCA==
X-Google-Smtp-Source: ABdhPJwRr/FwQpe7dKk8pmg8H/cUjDmWIFuRPHGSosKhPuxMlj+z/HBIhpQTLB9cSGSc+hfMahv5og==
X-Received: by 2002:a63:e057:: with SMTP id n23mr213338pgj.87.1601043550492;
	Fri, 25 Sep 2020 07:19:10 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	j19sm2930829pfe.108.2020.09.25.07.19.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 25 Sep 2020 07:19:09 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <7a0600d8-d886-c546-378c-5298a16e979c@kernel.dk>
Date: Fri, 25 Sep 2020 08:19:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: Re: [dm-devel] clean up is partition checks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/2/20 11:40 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series add a new helepr to check if a struct block_device represents
> a parition, and removes most direct access to ->bd_contained from
> drivers.

Applied, thanks.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


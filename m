Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E92B37B424
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 04:22:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-QddbMiqEPdKDfJn-l9IU8w-1; Tue, 11 May 2021 22:21:58 -0400
X-MC-Unique: QddbMiqEPdKDfJn-l9IU8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B01DCFC95;
	Wed, 12 May 2021 02:21:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AE2E144;
	Wed, 12 May 2021 02:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2957E5535C;
	Wed, 12 May 2021 02:21:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14C2LU3U029822 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 22:21:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5661C1041AF4; Wed, 12 May 2021 02:21:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 522651041AFA
	for <dm-devel@redhat.com>; Wed, 12 May 2021 02:21:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9305185A79C
	for <dm-devel@redhat.com>; Wed, 12 May 2021 02:21:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-282-V7MakicgMb-7l5RK4l24wQ-1; Tue, 11 May 2021 22:21:22 -0400
X-MC-Unique: V7MakicgMb-7l5RK4l24wQ-1
Received: by mail-pf1-f172.google.com with SMTP id c13so4025551pfv.4;
	Tue, 11 May 2021 19:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=daaDmlZfNtYf87e9KKZ0tzPnbye9JR8o5YOaGDdi4mk=;
	b=kbS9bPrU+UmrgN6D2Qg0dbXRpHWFaJwy6/DCrVRHDrCuF4otD5dgD/bv9rvr+9heOo
	5sLlVzMHLLFENxsQhhVsfOPq6Snxpa+dA296VQnofoeSDns5phGv1rKXJKLzeS+omV/S
	Laygn79ioAvscYjdoMxsSBN+evsxscNBIv+2LK/QwdofrwpHy4bHyTv6+dDaK85ECjQr
	xILxWHE/B1JVeG6u/QqcJJWpjZlD1i6Q+y9hPgL5XmcAILEaVY5OC5LDWZW/7ADpPbM3
	eeQHpHGNakbweuOYySvP227gfnBDkJ1l7IUxpdB8feIEOT8jr+x+L0J0KsR82HOr6YlI
	oMLQ==
X-Gm-Message-State: AOAM531WNcMz//ZPfUjMLqpPdWMyp88HCRiHrJmVJh0gXHyQTMc93ukj
	KJJIZJIizR9/pUhDJ6Prkrg=
X-Google-Smtp-Source: ABdhPJxg29un7hemzeM5RTmLf4VW113rEN7QX/F07mMfJ5zwt/qmJ20P8JnH+74H64FqIu6d5/qcuA==
X-Received: by 2002:aa7:8e85:0:b029:28f:2620:957e with SMTP id
	a5-20020aa78e850000b029028f2620957emr33862188pfr.40.1620786080715;
	Tue, 11 May 2021 19:21:20 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:76b9:3c77:17e3:3073?
	([2601:647:4000:d7:76b9:3c77:17e3:3073])
	by smtp.gmail.com with ESMTPSA id
	w74sm14613953pfc.173.2021.05.11.19.21.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 11 May 2021 19:21:18 -0700 (PDT)
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
References: <BYAPR04MB49652C4B75E38F3716F3C06386539@BYAPR04MB4965.namprd04.prod.outlook.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <4b8985f1-8a94-d611-e9fb-1b5e32a19f1e@acm.org>
Date: Tue, 11 May 2021 19:21:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB49652C4B75E38F3716F3C06386539@BYAPR04MB4965.namprd04.prod.outlook.com>
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"osandov@fb.com" <osandov@fb.com>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>, "hch@lst.de" <hch@lst.de>,
	"Frederick.Knight@netapp.com" <Frederick.Knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/10/21 5:15 PM, Chaitanya Kulkarni wrote:
> * What we will discuss in the proposed session ?
> -----------------------------------------------------------------------
> 
> I'd like to propose a session to go over this topic to understand :-
> 
> 1. What are the blockers for Copy Offload implementation ?
> 2. Discussion about having a file system interface.
> 3. Discussion about having right system call for user-space.
> 4. What is the right way to move this work forward ?
> 5. How can we help to contribute and move this work forward ?

Are there any blockers left? My understanding is that what is needed is
to implement what has been proposed recently
(https://lore.kernel.org/linux-nvme/yq1blf3smcl.fsf@ca-mkp.ca.oracle.com/).
Anyway, I'm interested to attend the conversation about this topic.

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


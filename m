Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB7697F73
	for <lists+dm-devel@lfdr.de>; Wed, 15 Feb 2023 16:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676474581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=byOFBxIxXLdQ99bOuAcD/a22HJi/0njZ3AMeUW+X5m0=;
	b=L7/34QUDMw8qJbwqteHTekWLJNiSnmFhTc1V9zod9AV3wDvEcPIOG8v7/Cs0BcZ15fGyKS
	TK/lqaCZ5VHit01pDCEoyXc41vGP/sWvuYlHQZ1qpyPf/QE8bKYlikYwSPesiYn3hxt1NQ
	7nqNVquy9vSFAYOLgP9RvbNFzSqcIrg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-AjTxOah5M9SOFcIjnVP0Iw-1; Wed, 15 Feb 2023 10:22:59 -0500
X-MC-Unique: AjTxOah5M9SOFcIjnVP0Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 549B518E0044;
	Wed, 15 Feb 2023 15:22:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82A42140EBF4;
	Wed, 15 Feb 2023 15:22:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 004DB19465A8;
	Wed, 15 Feb 2023 15:22:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D6FA1946588
 for <dm-devel@listman.corp.redhat.com>; Wed, 15 Feb 2023 15:22:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 38FC51121318; Wed, 15 Feb 2023 15:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3038B1121314
 for <dm-devel@redhat.com>; Wed, 15 Feb 2023 15:22:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 043B985A5A3
 for <dm-devel@redhat.com>; Wed, 15 Feb 2023 15:22:47 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-Wul3PaNfOxe2pR2nKr53pg-1; Wed, 15 Feb 2023 10:22:45 -0500
X-MC-Unique: Wul3PaNfOxe2pR2nKr53pg-1
Received: by mail-ua1-f49.google.com with SMTP id u3so3656774uae.0;
 Wed, 15 Feb 2023 07:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GWrEpYw1oDyFs1i/41lWQOwVP0ig3lg6jt+eM6m0lQ=;
 b=n6bZULo9W3UcHT694/EsjbC4i3tlHKiXIsU2r9iFGGvlGK8VPhNO8jHEz2dV39cb7J
 7YltK0omG3wMfVLSwswzuAcugA02kl1AOc5o1g0Mea2RAkAQHmVbVT6gd05/fQkcYH1y
 JwvQ0EsKvc4d0RFkupNwWzOqaPP1FRO5xjmZQVZbh5Ta7noS5p01C3OuR+/19cBcf9Hm
 fNKsGLLEP9Rr7cNYbvJckQBL1cNKZlCkx2iRFHPsHhAsk9FsOEKtgqyJ3PYdwxoX9xuP
 PBsBbUWXHeJlHs0YgbVrOvWKWsne8nHejAorHiWeXmyFYZmfWMoyhKFX+X//s3TcYJ35
 1Gyw==
X-Gm-Message-State: AO0yUKV2Xwy9nrKSPhrfbclz26h4hcKoPQAWWjbHiMzOQnzouwfsRT8i
 8DY2miMKCaZ09YnUqzbuU9hqVaM8z9Mh+aI0MzJQYayDJhk=
X-Google-Smtp-Source: AK7set8wTuoiA3mCAfz0aaCZdiHMLvmddGL/QP5ChqBubs3g2Q7JlCNmnUEjQcxpeNNJFGu3gsjjUbXmWCpukqRQIYc=
X-Received: by 2002:a05:6130:2104:b0:68a:570a:8ddb with SMTP id
 cl4-20020a056130210400b0068a570a8ddbmr317846uab.4.1676474564598; Wed, 15 Feb
 2023 07:22:44 -0800 (PST)
MIME-Version: 1.0
References: <CACsaVZJvXpCt37nQOoe8qd1EPUpfdMM1HwHk9tVO8HdU_Azhhw@mail.gmail.com>
 <25578.37401.314298.238192@quad.stoffel.home>
 <CACsaVZJ-5y7U5xqwL9bof69EKbTk+wrHWFcBFYyP_BwVSt+CNA@mail.gmail.com>
 <CAM23Vxr8LkkcVDFfW1=qEYGgo7JG1qx62eWSV4WOw4_MnD+TZA@mail.gmail.com>
 <CAAMCDeeHxMBoVkNYAyssjgjo4=FYd2NonS-mqC7OUEL89B9Cig@mail.gmail.com>
 <CAM23VxpzY6qYsdTYxe01FT7AJvEbODf8X_vq8ALL35TfyrB8xQ@mail.gmail.com>
 <CAAMCDee2hV1YP=119Rorz1uGTnyBD5q9hb20PvMq89FHow2wPw@mail.gmail.com>
 <0f5aafed-7b1a-99ac-57fc-c5de9a269b92@youngman.org.uk>
In-Reply-To: <0f5aafed-7b1a-99ac-57fc-c5de9a269b92@youngman.org.uk>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 15 Feb 2023 09:22:33 -0600
Message-ID: <CAAMCDed2eaygbYxFWDMBKELJ27XKNUZgGsJ1MKQK8qMCUTy+wA@mail.gmail.com>
To: Wols Lists <antlists@youngman.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] RAID4 with no striping mode request
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
Cc: Heinz Mauelshagen <heinzm@redhat.com>, John Stoffel <john@stoffel.org>,
 Linux-Kernel <linux-kernel@vger.kernel.org>, linux-raid@vger.kernel.org,
 Song Liu <song@kernel.org>, device-mapper development <dm-devel@redhat.com>,
 Kyle Sanderson <kyle.leet@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SMART on the disk marks the disk as FAILED when you hit the
manufacturer's posted limit (1000 or 2000 writes average).    I am
sure using a "FAILED" disk would make a lot of people nervous.

The conclusion of you can write as fast as you can and it will take 3
years to wear out would be specific to that specific brand/version
with a given set of chips in it, and may or may not hold to other
vendors/chips/versions, and so may have quite a bit of variation in
it.  I think I remember seeing that, but I don't remember what the
average write rate was.  The one I just found says 200TB of writes on
a 240g drive, so about 8000erases per cell was the lowest failure
rate, with some drives making it 3-5x higher.


On Wed, Feb 15, 2023 at 8:53 AM Wols Lists <antlists@youngman.org.uk> wrote:
>
> On 15/02/2023 11:44, Roger Heflin wrote:
> > WOL: current SSD's are rated for around 1000-2000 writes.  So a 1Tb
> > disk can sustain 1000-2000TB of total writes.  And writes to
> > filesystem blocks would get re-written more often than data blocks.
> >   How well it would work would depend on how often the data is deleted
> > and re-written.
>
> When did that guy do that study of SSDs? Basically hammered them to
> death 24/7? I think it took about three years of continuous write/erase
> cycles to destroy them.
>
> Given that most drives are obsolete long before they've had three years
> of writes ... the conclusion was that - for the same write load -
> "modern" (as they were several years ago) SSDs would probably outlast
> mechanical drives for the same workload.
>
> (Cheap SD cards, on the other hand ...)
>
> Cheers,
> Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


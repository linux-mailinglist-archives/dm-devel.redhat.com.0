Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C85115BF955
	for <lists+dm-devel@lfdr.de>; Wed, 21 Sep 2022 10:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663749252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=v4F4R4IawOUo1d5a0lm9v/4cKtema6BNXsWGuS25RIA=;
	b=ZNMIV8k9xdLQd2fBpiWWNn0CumsWsdD6XmLM7lNGzjcH3bEwr9iibGk+G1ULnSmDlmPxQC
	ppeCNv0liNHHOZhqUYRQFqkTJIlFXa0jvWxPC2YN9xzaxeOASE+M1kJldEmpfiYJF7QIBL
	w4J/rbO2ibkYmBNAC66LyeFCpSC7qK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-BNUNZIgVNIKAj9M-1fem7A-1; Wed, 21 Sep 2022 04:34:09 -0400
X-MC-Unique: BNUNZIgVNIKAj9M-1fem7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9088385A59D;
	Wed, 21 Sep 2022 08:34:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35B7D40C83AD;
	Wed, 21 Sep 2022 08:33:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1926E1946A41;
	Wed, 21 Sep 2022 08:33:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C408319465A0
 for <dm-devel@listman.corp.redhat.com>; Tue, 20 Sep 2022 10:17:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B70D9207B31F; Tue, 20 Sep 2022 10:17:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 871CB207B31A
 for <dm-devel@redhat.com>; Tue, 20 Sep 2022 10:17:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 681AF1019C89
 for <dm-devel@redhat.com>; Tue, 20 Sep 2022 10:17:26 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-hzvaDuuuNzu1S9lvU_HRyQ-1; Tue, 20 Sep 2022 06:17:22 -0400
X-MC-Unique: hzvaDuuuNzu1S9lvU_HRyQ-1
Received: by mail-vs1-f44.google.com with SMTP id h1so2494986vsr.11
 for <dm-devel@redhat.com>; Tue, 20 Sep 2022 03:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=8eh9R6jMTLeocgYG/SHsF59he1cgG2DVQ7XtF5nkuzY=;
 b=hTxge3DXQaoOnkUaYL7E/Ve6slxQcDC9laui2Ez8ibBkAs+/jg9rBk+jq0TVgudW/x
 GH+tpNHL1bmHF9wfgvWMQlDMDq8rvdiD2hTzWDz4tts2FMKKuXS5hlrG+h4fJgl+L6BX
 SWJY3+TLl/h1MMvS012BXv5AipN22SVlxCoIh4NxDutlmognfQpg2cG5MrZ3qKFeBt2R
 u7OSWBef1uIzNHSAWGc9wWUbVrY+pQ4XCp9+GH6sV9N4XS2fQgqpEIoUM2Ct/GhZ6tiA
 HwpHWMV53j+9ttEFhXE8wLFuHfmJUk3mgQGoGHpxJDYDuQ1tKj2NGzRRXONj9d5LZmuo
 BuQQ==
X-Gm-Message-State: ACrzQf3LveQ6pEP83SRS0yCYSlRkMN4oiNDUCMDKXqPAsMiuY8mROtiq
 9rx1lgTOEm3js42TkxxzWOf5H8Eyym933imxYGiv
X-Google-Smtp-Source: AMsMyM6q/JEwmgElGaB+hcOHS0mOtWTWMJbqJlXRLkpeyogIOQtkLFSksE8UfrnWCI8xfRglKrYwpNScBeLXikLwPaw=
X-Received: by 2002:a05:6102:508b:b0:39a:cfba:271a with SMTP id
 bl11-20020a056102508b00b0039acfba271amr5373773vsb.76.1663669041785; Tue, 20
 Sep 2022 03:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220915164826.1396245-1-sarthakkukreti@google.com>
 <YyQTM5PRT2o/GDwy@fedora>
 <CAG9=OMPHZqdDhX=M+ovdg5fa3x4-Q_1r5SWPa8pMTQw0mr5fPg@mail.gmail.com>
 <Yylvvm3zVgqpqDrm@infradead.org>
In-Reply-To: <Yylvvm3zVgqpqDrm@infradead.org>
From: Daniil Lunev <dlunev@google.com>
Date: Tue, 20 Sep 2022 20:17:10 +1000
Message-ID: <CAAKderPF5Z5QLxyEb80Y+90+eR0sfRmL-WfgXLp=eL=HxWSZ9g@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 21 Sep 2022 08:33:55 +0000
Subject: Re: [dm-devel] [PATCH RFC 0/8] Introduce provisioning primitives
 for thinly provisioned storage
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
Cc: Jens Axboe <axboe@kernel.dk>, Gwendal Grignou <gwendal@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bart Van Assche <bvanassche@google.com>, Mike Snitzer <snitzer@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-ext4@vger.kernel.org, Evan Green <evgreen@google.com>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6779257380652396514=="

--===============6779257380652396514==
Content-Type: multipart/alternative; boundary="00000000000042f21705e91922d4"

--00000000000042f21705e91922d4
Content-Type: text/plain; charset="UTF-8"

> So bloody punich the vendors for it.  Unlike most of the Linux community
> your actually have purchasing power and you'd help everyone by making
> use of that instead adding hacks to upstream.

Hi Cristoph,
I just want to note that the primitive this patchset introduces would not
map
to WRITE ZERO command in NVMe, but to WRITE UNAVAILABLE in
NVME 2.0 spec, and to UNMAP ANCHORED in SCSI spec.

--Daniil

--00000000000042f21705e91922d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; So bloody punich the vendors for it.=C2=A0 Unlike mos=
t of the Linux community<br>&gt; your actually have purchasing power and yo=
u&#39;d help everyone by making<br>&gt; use of that instead adding hacks to=
 upstream.<div><br></div><div>Hi Cristoph,</div><div>I just want to note th=
at the primitive this patchset introduces would not map<br></div><div>to WR=
ITE ZERO command in NVMe, but to WRITE UNAVAILABLE in=C2=A0</div><div>NVME =
2.0 spec, and to UNMAP ANCHORED in SCSI spec.</div><div><br></div><div>--Da=
niil</div></div>

--00000000000042f21705e91922d4--

--===============6779257380652396514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============6779257380652396514==--


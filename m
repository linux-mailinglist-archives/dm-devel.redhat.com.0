Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EF6E50AC
	for <lists+dm-devel@lfdr.de>; Mon, 17 Apr 2023 21:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681758841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TqK4CxA3Ed4fMHZ2eF4SXLUYlXsnMF2SyepUmOTjWqk=;
	b=gU4UMOFntgXmHUXdCSga5gf/dJdpLLCFyV1hZrFZpgI5eRQzTJuqu7+TGxOrdwGGtrX3Sf
	sD/cgIgWXjg2Kxf7t2nIcM/GIBbE8oqlyX9sOvgkEMQxPDLar+y+IhKKKg2TzoPBuk/Z9G
	2H8ZMe7cOEOviJYVgY5/M8SH0fSZW3E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-crS0DzWlPr-O2FmJ6Y3wvw-1; Mon, 17 Apr 2023 15:14:00 -0400
X-MC-Unique: crS0DzWlPr-O2FmJ6Y3wvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC64D855304;
	Mon, 17 Apr 2023 19:13:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 064C840B3ED6;
	Mon, 17 Apr 2023 19:13:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8ECE219465A8;
	Mon, 17 Apr 2023 19:13:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4BCF21946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 17 Apr 2023 19:13:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A098141511D; Mon, 17 Apr 2023 19:13:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02CCC1402C08
 for <dm-devel@redhat.com>; Mon, 17 Apr 2023 19:13:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8710101A54F
 for <dm-devel@redhat.com>; Mon, 17 Apr 2023 19:13:54 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-1DRKLjqGMHyQGkkFDUHKAQ-1; Mon, 17 Apr 2023 15:13:53 -0400
X-MC-Unique: 1DRKLjqGMHyQGkkFDUHKAQ-1
Received: by mail-qv1-f52.google.com with SMTP id op30so14924442qvb.3
 for <dm-devel@redhat.com>; Mon, 17 Apr 2023 12:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681758832; x=1684350832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBtJVDxHkjT7DQCSOQzNe2IthXptum9ChouKTqEU27w=;
 b=jokuRAVIM7+AqGHkoQODxUrUScYfHuE5SziIhpxAtQlLSnB1IodrSRKPL+zJ2axDYU
 EMhU3stwTD70Y+rRaJmfOWZwuJ3UqPxUPrj3jPwR6mP0s2KwraAD082sNr6TKuaBCzdw
 djZSl26mG6GHPt+qW+SXlMP236K0waoXaS0RpkrF2WCE35F9Vz6uQy1Bibw5/YsVtEG+
 DkZ/fygdlFpi0ZCn5xsoOkJDF/RbpSHZE2mCGGvICIbYG9UML9g7QLULHaT4kz+kdMyv
 RzQwCSwA56KKCSEJMByyXOtQljI+bQeFTN8pfBgXNwPpvOokJwPj2ONZ4W1oyovgWVag
 Lv9A==
X-Gm-Message-State: AAQBX9e8TZRvxC5tLqNJRtXTrwyXvBQHpez0UeC02SRI9k4zp0IqA7TV
 kxE7HUobtuJyln+YvFAAPP/J0Uo=
X-Google-Smtp-Source: AKy350YhhMmQjUtscx8DWNyjxCDA5LGW9pBXnmkkJTzahbIxgePxnjEG+PUB8GZIdmsQdXDjMB2WVw==
X-Received: by 2002:a05:6214:5084:b0:5ef:6101:3282 with SMTP id
 kk4-20020a056214508400b005ef61013282mr11320857qvb.0.1681758832583; 
 Mon, 17 Apr 2023 12:13:52 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 ed25-20020a05620a491900b0074856680834sm3332329qkb.132.2023.04.17.12.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 12:13:52 -0700 (PDT)
Date: Mon, 17 Apr 2023 15:13:50 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <ZD2abp1WQ0FqYXAT@redhat.com>
References: <20230407200551.12660-1-michael.christie@oracle.com>
 <20230407200551.12660-7-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230407200551.12660-7-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH v6 06/18] dm: Add support for block PR read
 keys/reservation
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, chaitanyak@nvidia.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
 james.bottomley@hansenpartnership.com, dm-devel@redhat.com,
 target-devel@vger.kernel.org, martin.petersen@oracle.com, kbusch@kernel.org,
 hch@lst.de
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 07 2023 at  4:05P -0400,
Mike Christie <michael.christie@oracle.com> wrote:

> This adds support in dm for the block PR read keys and read reservation
> callouts.
> 
> Signed-off-by: Mike Christie <michael.christie@oracle.com>

Acked-by: Mike Snitzer <snitzer@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel


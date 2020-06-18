Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECF41FF9B4
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 18:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592499056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LsAUb8AwIPaEsddjwFtDxwlSH7WGmlO48srzNwc0csc=;
	b=crkgu3fEWedA1KD14cQz7fpUjak9KhnMfgeIDdj3y0U+QM46+BcVlko0dVKWGQfWEglm0j
	Uwq/F3Y3WHrpYtJYmxd0rznxpg9E7kVieFBn0qSjsDPZjMU4weJDfepVdJU7VNo2DNregs
	+i4NsstzCTkxDo5v2+w0QYGIziYeoGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-xsdl5Hm6OxOspFROpnfySA-1; Thu, 18 Jun 2020 12:50:53 -0400
X-MC-Unique: xsdl5Hm6OxOspFROpnfySA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50764100CCC0;
	Thu, 18 Jun 2020 16:50:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C7B60E1C;
	Thu, 18 Jun 2020 16:50:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3553F1809542;
	Thu, 18 Jun 2020 16:50:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IGoKar000541 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 12:50:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E79D02029F70; Thu, 18 Jun 2020 16:50:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E01BB2028DCC
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 16:50:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E198007D1
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 16:50:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-lWT-xuvqPWaWsbCaQ-3Jgw-1; Thu, 18 Jun 2020 12:50:14 -0400
X-MC-Unique: lWT-xuvqPWaWsbCaQ-3Jgw-1
Received: by mail-pg1-f179.google.com with SMTP id v11so3149806pgb.6
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=12wguNIOpAai+aK7V0UMJZpRX5txJ+g8ecK8VN8zlk0=;
	b=Orl9iSp2iIVQYO/V0JsQzdHz2CypIgkbnojfmwD7FTJFMkRxGSKj2xnOrD/d4Pu6Fd
	Xk77mmljsHTzLlm9mWUbHBdSBXSUWaxhi84ndDKmA5vMP7ZDtHoKv1I5IMl/7PEPDb0d
	Kzi1PKOC9XuwMDs8lfoOLdULajv3p+yji6jg2A+Jn4MDTqo+67RKbBjStpluMB4KGRvP
	N9uxQlmfkze8KK3c4jojxRAiUzZGrzQKyoie+0ek8Lq0mqEsveedG8n+B9dmoDm65SJV
	ylvYEbEG1wERb9kOxM7Yn67mdzNDW4QLvD3FOGVogqXceA3ZcKui4JlZs8BTSDYMmMsZ
	ZUxQ==
X-Gm-Message-State: AOAM530nO6vkVFrunko+xY3Yyogjr/BL/xfSYw314YMjyFHaNziEQdyj
	lAc/XfapPtjoyi1a4HoNdzDNKQ==
X-Google-Smtp-Source: ABdhPJwQv/SRknVfzl7s0fd5YGcHkIu/0H0T9dpTN4FKjOEnDG7eWQSrqBX1H2vFyL3jUAUbV4QzQA==
X-Received: by 2002:a63:63c2:: with SMTP id x185mr716198pgb.57.1592499013421; 
	Thu, 18 Jun 2020 09:50:13 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
	by smtp.gmail.com with ESMTPSA id u1sm2981749pgf.28.2020.06.18.09.50.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 18 Jun 2020 09:50:12 -0700 (PDT)
Date: Thu, 18 Jun 2020 09:50:06 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200618165006.GA103290@google.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200618154444.GB18007@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	JeongHyeon Lee <jhs2.lee@samsung.com>, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] New mode DM-Verity error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
> I do not accept that panicing the system because of verity failure is
> reasonable.
> 
> In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
> 
> The device should be put in a failed state and left for admin recovery.

That's exactly how the restart mode works on some Android devices. The
bootloader sees the verification error and puts the device in recovery
mode. Using the restart mode on systems without firmware support won't
make sense, obviously.

Sami

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


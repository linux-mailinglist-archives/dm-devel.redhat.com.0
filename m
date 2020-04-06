Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AD8C419FDCB
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 21:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586199600;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AiZaPEsaetVlK0PnrU4YsrJUyjj4SxF5+W2jhaa5R6c=;
	b=VTmvEgD9IQJq6nGbaraABDcm8IME1qgLOlcux7KlZAaHWHKbdQHMRBEts9txwfYYUIt389
	Xc4AYUAwpZrfpKITS6ka3BP5hkoUochZRQMVcqgt1tMWtiTFCeQELrqyR/2WoIO5GBea0j
	92nFgnB9GFaWG7ztLbVhl1I7PcTael0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-X_coSIh6MGmuRav4lelZzQ-1; Mon, 06 Apr 2020 14:59:55 -0400
X-MC-Unique: X_coSIh6MGmuRav4lelZzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68C861005F75;
	Mon,  6 Apr 2020 18:59:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE5E5E010;
	Mon,  6 Apr 2020 18:59:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C994793A7A;
	Mon,  6 Apr 2020 18:59:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036IaRX4004552 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 14:36:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 146BB10D18DE; Mon,  6 Apr 2020 18:36:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10B1510D18CA
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:36:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9FE0101A55E
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:36:24 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-347-2gOeumhUNu6kEYT5FdTkWQ-1;
	Mon, 06 Apr 2020 14:36:20 -0400
X-MC-Unique: 2gOeumhUNu6kEYT5FdTkWQ-1
Received: by linux.microsoft.com (Postfix, from userid 1033)
	id 51D582072933; Mon,  6 Apr 2020 11:36:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 51D582072933
Date: Mon, 6 Apr 2020 11:36:19 -0700
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Message-ID: <20200406183619.GA77626@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036IaRX4004552
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Apr 2020 14:59:16 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@linux.microsoft.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RESEND PATCH 00/11] Integrity Policy Enforcement
	LSM (IPE)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline



This was resent due to an incorrect domain for dm-devel (redhat.org vs redhat.com), and an email address
that was bouncing.

Additionally, this is an RFC, and this tag will be added in the next iteration.

- Deven


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


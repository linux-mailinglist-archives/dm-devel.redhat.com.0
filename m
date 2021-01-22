Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4104B302300
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 09:50:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-v6nSZg38OMK_ouxG18oDSA-1; Mon, 25 Jan 2021 03:49:08 -0500
X-MC-Unique: v6nSZg38OMK_ouxG18oDSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D01B612AB;
	Mon, 25 Jan 2021 08:49:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA6935F9A6;
	Mon, 25 Jan 2021 08:49:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95E4F1809CA0;
	Mon, 25 Jan 2021 08:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MIIXUM018058 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 13:18:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B62B1031F52; Fri, 22 Jan 2021 18:18:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67D8310336C5
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 18:18:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED69800B3A
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 18:18:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-467-f-5F1w1YMJWpWtJ3-b0sxQ-1;
	Fri, 22 Jan 2021 13:18:28 -0500
X-MC-Unique: f-5F1w1YMJWpWtJ3-b0sxQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D1C23A6A;
	Fri, 22 Jan 2021 18:18:26 +0000 (UTC)
Date: Fri, 22 Jan 2021 20:18:24 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <YAsW8DAt3vc68rLA@kernel.org>
References: <20210122084321.24012-1-a.fatoum@pengutronix.de>
	<20210122084321.24012-2-a.fatoum@pengutronix.de>
	<YAsT/N8CHHNTZcj3@kernel.org>
MIME-Version: 1.0
In-Reply-To: <YAsT/N8CHHNTZcj3@kernel.org>
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
X-Mailman-Approved-At: Mon, 25 Jan 2021 03:48:36 -0500
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Mike Snitzer <snitzer@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	kernel@pengutronix.de, linux-integrity@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm crypt: support using trusted keys
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 22, 2021 at 08:05:51PM +0200, Jarkko Sakkinen wrote:
> On Fri, Jan 22, 2021 at 09:43:21AM +0100, Ahmad Fatoum wrote:
> > Commit 27f5411a718c ("dm crypt: support using encrypted keys") extended
> > dm-crypt to allow use of "encrypted" keys along with "user" and "logon".
> > 
> > Along the same lines, teach dm-crypt to support "trusted" keys as well.
> > 
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
> 
> Is it possible to test run this with tmpfs? Would be a good test
> target for Sumit's ARM-TEE trusted keys patches.
> 
> https://lore.kernel.org/linux-integrity/1604419306-26105-1-git-send-email-sumit.garg@linaro.org/

Also, I would hold merging *this* patch up until we are able to
test TEE trusted keys with TEE trusted keys.

/Jarkko

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


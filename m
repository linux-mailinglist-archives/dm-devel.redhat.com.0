Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A44DD1CD3A0
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ckNgLbfKblRXKvM7z+SGBZ2DmVOGDFYASnYvvvpdbNE=;
	b=GMJUpWuyM01MnQP5ebOCUYPeoIhzIyG3kIRpjDyaiFN9PjpvHt8Bq2Yj1rg6kVnxkEGLS6
	UaGdpWnpEvizXcclyxHtIXTxK9nuD88PJSduhJ51exnXUuqzm9nYc/ih/pWGJQBMNLl703
	fBvaPFpI1Z2XB7GK77uGZBsfQ3q2hGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-2_SPIFOlNBOWD6SGqwslWQ-1; Mon, 11 May 2020 04:18:58 -0400
X-MC-Unique: 2_SPIFOlNBOWD6SGqwslWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2E2835B57;
	Mon, 11 May 2020 08:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F04351C4F;
	Mon, 11 May 2020 08:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F04A1809554;
	Mon, 11 May 2020 08:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JN5GS011089 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:23:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C2AB1635A6; Fri,  8 May 2020 19:23:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0819B1635A8
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:23:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5DBD1859160
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:23:02 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
	(wout4-smtp.messagingengine.com [64.147.123.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-450-kfkf-2j2PC-0ekTfWj-9iw-1;
	Fri, 08 May 2020 15:22:58 -0400
X-MC-Unique: kfkf-2j2PC-0ekTfWj-9iw-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 46EC74C6;
	Fri,  8 May 2020 15:22:56 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
	by compute4.internal (MEProxy); Fri, 08 May 2020 15:22:56 -0400
X-ME-Sender: <xms:j7G1XikzBgVczNg3jVBNBPXtHYhfwUq22JYabuBbvn8Pf_VC6xDHQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeefgdejtdcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpehkjhesohhr
	sggvkhhkrdgtohhmnecuggftrfgrthhtvghrnhepteehuefhudevvdeflefgfeevuefhje
	fgjeekffefjeelvdetieevffelvdelkeeknecuvehluhhsthgvrhfuihiivgeptdenucfr
	rghrrghmpehmrghilhhfrhhomhepkhhjsehorhgsvghkkhdrtghomh
X-ME-Proxy: <xmx:j7G1XtLiP8ICnbAgYdpollYqTfScgh2ftg2WP9BWxtOsVFavJztjWQ>
	<xmx:j7G1XsctJkdSSDt3QzKngkXF892-cWvHZMQAGbBWfQ6Ql9Q2ocru7w>
	<xmx:j7G1XpzxDWy9N-hjBX8uBVEh9vwW4JQhfUocrWU8jLbUAVlhF2hq_A>
	<xmx:j7G1XrU7nBYjcuglBF_n0NVSMSiLPhQcj7jlmmoJmal20w_JDhLj_g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2910FC200A4; Fri,  8 May 2020 15:22:55 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <dd7b8b91-776b-4458-a83a-18ab4953d2f4@www.fastmail.com>
In-Reply-To: <DM6PR04MB49726E28257263F5A1C643B386A20@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20200507230532.5733-1-kj@orbekk.com>
	<DM6PR04MB49726E28257263F5A1C643B386A20@DM6PR04MB4972.namprd04.prod.outlook.com>
Date: Fri, 08 May 2020 15:22:33 -0400
From: kj@orbekk.com
To: "Chaitanya Kulkarni" <Chaitanya.Kulkarni@wdc.com>,
	"Alasdair G Kergon" <agk@redhat.com>, "Mike Snitzer" <snitzer@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: "harshads@google.com" <harshads@google.com>,
	Khazhismel Kumykov <khazhy@google.com>
Subject: Re: [dm-devel] [PATCH] dm: track io errors per mapped device
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

On Thu, May 7, 2020, at 21:12, Chaitanya Kulkarni wrote:
> On 05/07/2020 04:06 PM, Kjetil Orbekk wrote:
> > +		if (tio->error)
> > +			atomic_inc(&md->ioerr_cnt);
> 
> Given that there are so many errors how would user know what
> kind of error is generated and how many times?

The intended use case is to provide an easy way to check if errors have occurred at all, and then the user needs to investigate using other means. I replied with more detail to Alasdair's email.

-- 
KJ

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


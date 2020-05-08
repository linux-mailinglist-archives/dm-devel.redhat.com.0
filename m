Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4ED1CD3A4
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SfmbIeZZ4Lopg7kmbRS3E89q2FV+ERJHUEKEvzC/dkg=;
	b=WYh8cPKjPkrMWGIkrKj/LcpLENTYSqkbGdfSg/VgMEeSxZLe+Tm1q6GQ3GB03eeFPZecl2
	U6CmlQGpZuGrvzxSEA2+myc6md7f3Hm6kVySe5SqBIYbw88mIJPVQF9aM9bsZpReAVPMpc
	+353JXOyq4VE1l8c0oD5GulEiTsKf6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-8easuV6jMDmCi5ICwZx86g-1; Mon, 11 May 2020 04:19:22 -0400
X-MC-Unique: 8easuV6jMDmCi5ICwZx86g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B49D818FE86E;
	Mon, 11 May 2020 08:19:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2FF99D6;
	Mon, 11 May 2020 08:19:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C374E4CAAD;
	Mon, 11 May 2020 08:19:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JJ0uE010757 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:19:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 536581054828; Fri,  8 May 2020 19:19:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F8ED1054829
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:18:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E6E8001E2
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:18:57 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com
	(wout4-smtp.messagingengine.com [64.147.123.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-324--hZZ2h4kOAiIiQMiN7W_Og-1;
	Fri, 08 May 2020 15:18:50 -0400
X-MC-Unique: -hZZ2h4kOAiIiQMiN7W_Og-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 41ED44B3;
	Fri,  8 May 2020 15:18:48 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
	by compute4.internal (MEProxy); Fri, 08 May 2020 15:18:48 -0400
X-ME-Sender: <xms:l7C1XvviKSMz8Kh3mfFwt_JARy6JHCHtFZvS1DCr2U3ZG-LPk7dUNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeefgdeilecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpehkjhesohhr
	sggvkhhkrdgtohhmnecuggftrfgrthhtvghrnhepteehuefhudevvdeflefgfeevuefhje
	fgjeekffefjeelvdetieevffelvdelkeeknecuvehluhhsthgvrhfuihiivgeptdenucfr
	rghrrghmpehmrghilhhfrhhomhepkhhjsehorhgsvghkkhdrtghomh
X-ME-Proxy: <xmx:l7C1Xl3Sr3ZZMlR6qG2CstoFNLJUTV3ERV1uJq249sUZviaurhYo_Q>
	<xmx:l7C1Xmaa7YzwV7xAUJvldDAX0ne2fUzIeFeVbWSG595uIdo3pF6ZzA>
	<xmx:l7C1XuHayoxee8hFKLTnT-SE3iIXv8mP8fvZYiSqlZucpgT4J53ALg>
	<xmx:l7C1Xl-xlg9wLOKYa_efJzeGOj5iYXSJagEIcrSui4ertD4Go4kcpA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 660CCC200A4; Fri,  8 May 2020 15:18:47 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <48580ec0-fc4e-4faa-976f-0fb192cd08fa@www.fastmail.com>
In-Reply-To: <20200508001825.GC22266@agk-dp.fab.redhat.com>
References: <20200507230532.5733-1-kj@orbekk.com>
	<20200508001825.GC22266@agk-dp.fab.redhat.com>
Date: Fri, 08 May 2020 15:18:26 -0400
From: kj@orbekk.com
To: "Alasdair G Kergon" <agk@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, harshads@google.com,
	Khazhismel Kumykov <khazhy@google.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com, orbekk@google.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Alasdair,

Thank you for your time and comments.

On Thu, May 7, 2020, at 20:18, Alasdair G Kergon wrote:
> On Thu, May 07, 2020 at 07:05:33PM -0400, Kjetil Orbekk wrote:
> > This will track ioerr_cnt on all dm targets and expose it as
> > <device>/dm/ioerr_cnt.
> 
> How do you propose to use this?
> What are you trying to measure and why?
> - How exact must the number be to meet your requirements?

This is proposed in order to detect if I/O errors have occurred on the dm device. Deriving this from the ioerr_cnt from the underlying device was considered, but it's not reliable for dm devices that tolerate some underlying errors (raid setups and similar).

> Or to put it another way, do you need to know the exact number you are
> exposing, or do you derive something else from this which could also be
> derived from an alternative number?

Our use case is to detect if I/O errors have happened at all. We expect the ioerr_cnt to increase when there are errors, but the precise number is not important in our environment.

> In particular, given the way we split and clone and stack devices (so
> there may be an element of multiplication), and reload tables (so
> existing values might become irrelevant), did you consider alternative
> semantics before selecting this approach?
>
> (Or to put it another way, is there a need to reset it or track
> the value since the last resume?)

I'm not very familiar with dm and I don't follow how the cloning and stacking will lead to multiplication. Do you have any suggestions for how I might deal with that?

Resetting the value would not be desirable for our use case, because the probing process can miss I/O errors that happen right before a device is suspended and then resumed, though I can imagine that there might be cases where one would want that. Users could look at increases in ioerr_cnt instead of the absolute numbers, or I could provide a way to reset the counter if desired.

> (Documentation is also needed - which ought to explain the semantics
> and how the observed values interact with the use of device-mapper
> features.)

I will be happy to provide an updated patch with inline documentation once I have addressed your comments. Are there any other places where I need to update documentation?

-- 
Stay safe!
KJ

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


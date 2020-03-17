Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 340F1188B8D
	for <lists+dm-devel@lfdr.de>; Tue, 17 Mar 2020 18:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584464718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jPgkK0BfciGQKBjVm8/DKLcna5tF32qH01dVjgiTXOQ=;
	b=TvxwDCwuRXYlpKa3GNZz/GZ/qi4G3AVq99SdHMgfDDPVn1LhFEKX1FE6f6MMeq1Uwgmh19
	c27TIyV8BWzRYC+VDISBhh0GDQs0qNPoU0RXHRlplPP686QjJAI/AkiFXX0cBzsxrdRr/a
	tsAoTSR/ZGOJSH8bYOu5AG5xs5rvE70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-nYFjDqm8NB-MFlU1bm3lzg-1; Tue, 17 Mar 2020 13:05:15 -0400
X-MC-Unique: nYFjDqm8NB-MFlU1bm3lzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F9A8018A4;
	Tue, 17 Mar 2020 17:05:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 606B71036D13;
	Tue, 17 Mar 2020 17:05:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6F9086FFE;
	Tue, 17 Mar 2020 17:04:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HH4jfp010699 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 13:04:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4FA910A4786; Tue, 17 Mar 2020 17:04:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD99106691E
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 17:04:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25682907780
	for <dm-devel@redhat.com>; Tue, 17 Mar 2020 17:04:43 +0000 (UTC)
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-303-nLaVUcIkM2SQ3J41KZAy8g-1;
	Tue, 17 Mar 2020 13:04:39 -0400
X-MC-Unique: nLaVUcIkM2SQ3J41KZAy8g-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C35568EE232; 
	Tue, 17 Mar 2020 10:04:31 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jFkens1H5Ia7; Tue, 17 Mar 2020 10:04:27 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 762F88EE109;
	Tue, 17 Mar 2020 10:04:21 -0700 (PDT)
Message-ID: <1584464656.4545.15.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Sami Tolvanen <samitolvanen@google.com>, "Shetty, Harshini X (EXT-Sony
	Mobile)" <Harshini.X.Shetty@sony.com>
Date: Tue, 17 Mar 2020 10:04:16 -0700
In-Reply-To: <CABCJKuf6X6fi8fqF_z0HYX0rnD8b98=L-8Y31=OiPEVzw0d1_Q@mail.gmail.com>
References: <5e70da92.1c69fb81.c30ac.5d5cSMTPIN_ADDED_BROKEN@mx.google.com>
	<CABCJKuf6X6fi8fqF_z0HYX0rnD8b98=L-8Y31=OiPEVzw0d1_Q@mail.gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02HH4jfp010699
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>, "Takeuchi,
	Shingo \(SOMC\)" <Shingo.Takeuchi@sony.com>, "Nagaraju,
	Srinavasa \(SOMC\)" <Srinavasa.Nagaraju@sony.com>, "Khasnis,
	Soumya X \(EXT-Sony Mobile\)" <Soumya.Khasnis@sony.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "Takahashi,
	Masaya \(SOMC\)" <Masaya.Takahashi@sony.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm verity fec: Fix memory leak in
 verity_fec_ctr
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

You two broke threading on this for what looks like non-trivial
reasons.  Threading is becoming very important to us with the mbox
tools, so it's important to get right.

The original problem is that the first message id is illegal under RFC
2822:

> Message-Id:	<20200317091212.GA18241@harshini.x.shetty@sony.com>

You can't have two @ signs in a Message-id.  However, your emailer
completely made up the in-repy-to id which should quote the original
message id:

> References: <5e70da92.1c69fb81.c30ac.5d5cSMTPIN_ADDED_BROKEN@mx.google.com>
> In-Reply-To: <5e70da92.1c69fb81.c30ac.5d5cSMTPIN_ADDED_BROKEN@mx.google.com>

Which is why threading broke.

Can you both try to fix this?  The google problem looks to be atypical
because if I look at any other mailer behaviour it will simply quote a message-id back in the In-Reply-To without checking for legality.

James


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


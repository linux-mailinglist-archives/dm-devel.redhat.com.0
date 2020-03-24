Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 53E76190A01
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 10:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585043717;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=czdSlbALpSTvhmOJ/ep/A4Vfyb59UuHiysP/HpKpOHg=;
	b=gdGP8hIsTt4Sl23W/bnqZ/mHWAl1+sCdyBo2USewH4R9Y0ftCripFPxVSl778/pxZtxu4u
	mWZDQLMgLc4OYQeqBPdjM2QmBI/aNML9U2Do6GDeL/xN6ll7HGTDO7tyk9Sqsk7pagBeQ0
	1oSGQX/gs927g11bkmhTDZ4t3bcBC9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-sXCGOuKlNg-F93npgh7Sig-1; Tue, 24 Mar 2020 05:55:15 -0400
X-MC-Unique: sXCGOuKlNg-F93npgh7Sig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4DB6107ACC7;
	Tue, 24 Mar 2020 09:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44B745DA66;
	Tue, 24 Mar 2020 09:55:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE1A88A023;
	Tue, 24 Mar 2020 09:55:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O9qwLh004769 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 05:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4358E2063205; Tue, 24 Mar 2020 09:52:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FBF72063206
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 09:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75AA38FF663
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 09:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-rmys6EMLNHGip6dC8qdZJA-1; Tue, 24 Mar 2020 05:52:52 -0400
X-MC-Unique: rmys6EMLNHGip6dC8qdZJA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jGfsg-0004zM-4T; Tue, 24 Mar 2020 09:29:54 +0000
Date: Tue, 24 Mar 2020 02:29:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200324092954.GA16679@infradead.org>
References: <20200304163953.578311-1-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200304163953.578311-1-krisman@collabora.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O9qwLh004769
X-loop: dm-devel@redhat.com
Cc: Tahsin Erdogan <tahsin@google.com>, snitzer@redhat.com,
	Khazhismel Kumykov <khazhy@google.com>, dm-devel@redhat.com,
	kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] iscsi: do not wait for IOs in dm shrinker
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The Subject is wrong - this is a device mapper patch, not an iscsi
one.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


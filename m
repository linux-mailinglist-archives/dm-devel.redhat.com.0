Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7C671103EEB
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 16:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574264272;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JmhJxlxBsbZQDXbEnnyC7NBGsctyv2F53qEFwBhx9+w=;
	b=ftqQ76LMm5ZZZ9CdekDq7B6hSLmYkcNImyn6JpIhvVc4MMHtJp6wJNnqJfAqp0E1nZd/DJ
	TbNvNIt779yzUR3t17IiZwI3nooYeNw31GFXQ3YU9232bkeBdcmZQkyy28gi67tjwrLsNA
	56ejXet87ud9zfezlTSq8cnoaUKYGyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-AAYqLVk-PsSbexSsOzrezQ-1; Wed, 20 Nov 2019 10:37:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B9EC477;
	Wed, 20 Nov 2019 15:37:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 160F138E04;
	Wed, 20 Nov 2019 15:37:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47C9E18034EA;
	Wed, 20 Nov 2019 15:37:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKFbPJ4007408 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 10:37:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0C9E67CFC; Wed, 20 Nov 2019 15:37:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FA8E5C1D4;
	Wed, 20 Nov 2019 15:37:23 +0000 (UTC)
Date: Wed, 20 Nov 2019 10:37:22 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20191120153722.GA24993@redhat.com>
References: <20191120134110.14859-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191120134110.14859-1-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] md: Fix Kconfig indentation
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
X-MC-Unique: AAYqLVk-PsSbexSsOzrezQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Nov 20 2019 at  8:41am -0500,
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> =09$ sed -e 's/^        /\t/' -i */Kconfig
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, I've picked this up but changed the subject from "md:" to "dm:"
considering the bulk of the changes relate to DM config sections.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


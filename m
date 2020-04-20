Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0476B1B067D
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:23:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587378231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5zqLvU+xFXSAaudxY543depaj/gQ3D8oAMV20cwLcsI=;
	b=geelER5Avuy03s+D1IX0TNuxP9O4P6mtUCkdqpPK9BbPwFoiDUVaah7I77Ug83D5bBlnSq
	UQo95E0kEZodQCMn0d0UaqjXelPVEXHVpAqH6H0/Mt81o1jIlv5+Ae/erOIevLQVomt0PB
	qp5zJXbI3JbBtNHaD/EPVCZ+9C9zm2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-hbSmLg_PMDuBH7X1IrzdRg-1; Mon, 20 Apr 2020 06:23:26 -0400
X-MC-Unique: hbSmLg_PMDuBH7X1IrzdRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ACC3107ACC9;
	Mon, 20 Apr 2020 10:23:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC2926579;
	Mon, 20 Apr 2020 10:23:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F35F19350C;
	Mon, 20 Apr 2020 10:23:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KAN6kV009665 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:23:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B129960C63; Mon, 20 Apr 2020 10:23:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost.localdomain (unknown [10.40.194.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46F8160C84;
	Mon, 20 Apr 2020 10:23:00 +0000 (UTC)
To: Paul Wise <pabs3@bonedaddy.net>, dm-devel@redhat.com
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
	<20200419131908.GA22398@redhat.com>
	<9cb6a39a43178be29af2f47a92c2e84754b62b69.camel@bonedaddy.net>
	<6bbf9d94-2fbb-f96f-ea85-a480ba109c55@redhat.com>
	<a0034feda1f6f598c8376a418949b48109307e67.camel@bonedaddy.net>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <6e458e2a-f8aa-d6e3-0e6d-7c11ad2a6825@redhat.com>
Date: Mon, 20 Apr 2020 12:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a0034feda1f6f598c8376a418949b48109307e67.camel@bonedaddy.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/3] dm raid/raid1: enable discard support
 when any devices support discard
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/20/20 12:13 PM, Paul Wise wrote:
> On Mon, 2020-04-20 at 09:35 +0200, Ondrej Kozina wrote:
> 
>> Did you have discard allowed on both dm-crypt devices? dm-crypt
>> (kernel) does not allow discards by default.
> 
> I did not, I guess that explains why I got no errors.
> 

FYI if you use LUKS2 metadata format for encrypted drives, you can 
enable discards by default once and for all by following command:

cryptsetup open /dev/sdx sdx_unlocked --allow-discards --persistent

Any following unlock will enable discards automatically.

Regards O.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


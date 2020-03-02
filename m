Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 24881175838
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 11:19:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583144393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QpbWowI0Kd87N3kfs6ILUXIYGuA9GBYpt0gGh5esOuo=;
	b=W8fbV+qFHZnl5VqaIPq7VEgnG3vWSig7BpbcW0Pa5TUf2iLE4sfDOF/n3tSIDFSAmpoNeF
	h8ydpdmWo03+M+rviwI5SUrPOw9mvkeS+EQnPGID8wKSCoJE3pWkDYiwKiTwWnhzcuB3uw
	68WEVuLGwWOr73gG9cM6UHMIbqkfbCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-2PcO12HtMDW5AptO740guQ-1; Mon, 02 Mar 2020 05:19:50 -0500
X-MC-Unique: 2PcO12HtMDW5AptO740guQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22C18017DF;
	Mon,  2 Mar 2020 10:19:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B395DA75;
	Mon,  2 Mar 2020 10:19:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A64686A05;
	Mon,  2 Mar 2020 10:19:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022AJSuV023363 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 05:19:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B23802166B2B; Mon,  2 Mar 2020 10:19:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF642166B2E
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 10:19:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BDC2800295
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 10:19:26 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
	[217.70.178.230]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-6Pw8H-ckMy-2n1NXdjWT9Q-1; Mon, 02 Mar 2020 05:19:23 -0500
X-MC-Unique: 6Pw8H-ckMy-2n1NXdjWT9Q-1
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41]) (Authenticated sender: gmail@opensvc.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id D4FFF240005;
	Mon,  2 Mar 2020 10:19:20 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id h8so10910402iob.2;
	Mon, 02 Mar 2020 02:19:20 -0800 (PST)
X-Gm-Message-State: APjAAAUE6IIYv0Rol/OXpdupghvY9IFAvv8K56RdUNDRPrfyw7qIgfGH
	GFS0FjsugKaaiSojJfbuw8JOFKJLKMkc8Ino+tU=
X-Google-Smtp-Source: APXvYqwyiLMfXWnSZegxPAl8L2u4X5USQRcBimsI0fHnkQTsTi32ilnPSeLyCvWRkABv/UKoae1v1cRkB5Lkhh1EYGc=
X-Received: by 2002:a5d:9e0a:: with SMTP id h10mr12418774ioh.257.1583144359566;
	Mon, 02 Mar 2020 02:19:19 -0800 (PST)
MIME-Version: 1.0
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 2 Mar 2020 11:19:08 +0100
X-Gmail-Original-Message-ID: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
Message-ID: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: [dm-devel] multipath-tools merges
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
Content-Type: multipart/mixed; boundary="===============2158512636044281849=="

--===============2158512636044281849==
Content-Type: multipart/alternative; boundary="0000000000002e2050059fdc859d"

--0000000000002e2050059fdc859d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ben, Martin,

I finally catched up with your changes from october till now.
Please review I did not mess up the merges, then i'll commit a version bump=
.

Thanks,
Christophe.

--0000000000002e2050059fdc859d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ben, Martin,<div><br></div><div>I finally catched=C2=A0=
up with your changes from october till now.</div><div>Please review I did n=
ot mess up the merges, then i&#39;ll commit a version bump.</div><div><br><=
/div><div>Thanks,</div><div>Christophe.</div></div>

--0000000000002e2050059fdc859d--

--===============2158512636044281849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2158512636044281849==--


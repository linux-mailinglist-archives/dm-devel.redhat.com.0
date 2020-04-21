Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EB15C1B4415
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 14:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587557692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z7+r3PV1mZ/YiECPIQA3DM++zRY+bVenn7c2jlNIWSI=;
	b=DmOHrWpU/F0FK0e1gUAV+G5qAkUAUgD1EPHCT0PtRXoAWOb0C8EHm9XsWCtfZCsdoGDEf4
	u3ce94flbbPWX8Rm4VnPu73FG/Ni38d/s1P1N36n1gNpa95QWuzHQKwq745NUfwMCFQQJd
	3ksv7HOK/uXqbYVfelf7W5qtU0m0s4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-53MHrc0AMT6kyUDkFfghbw-1; Wed, 22 Apr 2020 08:14:50 -0400
X-MC-Unique: 53MHrc0AMT6kyUDkFfghbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F4AA1084430;
	Wed, 22 Apr 2020 12:14:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D2F60BEC;
	Wed, 22 Apr 2020 12:14:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21703180954D;
	Wed, 22 Apr 2020 12:14:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LIWjO4028521 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 14:32:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EBFE5DA85; Tue, 21 Apr 2020 18:32:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast03.extmail.prod.ext.phx2.redhat.com [10.5.110.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5765DA82
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:32:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C932B19067E4
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 18:32:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-478-mGiZFcBBNJel1B2MRS0o3w-1; Tue, 21 Apr 2020 14:32:30 -0400
X-MC-Unique: mGiZFcBBNJel1B2MRS0o3w-1
Received: by mail-pf1-f173.google.com with SMTP id r14so6990985pfg.2;
	Tue, 21 Apr 2020 11:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IUWC+hp3XtQA9R5YnNkK4UW+yQY6O8BPrcpKB36bSHM=;
	b=AB9wVkg7tdz6e7++7MX4VyoNE4DNT+gY3UBx86B4DXbOvw58qx33Qt+QsUjfWrRG5V
	uc+cOsLYf+oqZh8p94uPbcRABEtYz8L6MMl4qDTvHo+6ZdeHNIq/QpNm6dJJ+p0ycsv7
	q31QSKoxK6Z9uU/3SxwXckupzQRmfBzwzd63vvUTLAvp4AlXDkRov2ETpb0P8/k7f/z9
	yIJbq6whntoeXoefLgPbHQRBbvubBPBzv1JZspmPXnVuZXA0h0xH4UDZ1aBrcUDoowpS
	jI1AcHKw0VhAfEVk6bT4x46XipvGknj6M0Q3dABNsgyF0QBSi61Rhd8l2QOLGKL8JHGI
	l+tQ==
X-Gm-Message-State: AGi0Pub/GGphSQo5Q6t3xTdJNuyugDdoElhmabdXn2Ffm2nt8QAHdsZw
	Q6Wa89bhU7xltYJvOCPhj0PwJeeXyCwAkMKwLkwanwo7
X-Google-Smtp-Source: APiQypKS9VoJT5dr8Yr7KIlwOzs9jI4g+IuxzfbRZ4RrktaMD2Sg8YljbMf9o7rvCSo3W8R9PBm8KAiTofWscK/cg1I=
X-Received: by 2002:a62:1549:: with SMTP id 70mr5818719pfv.43.1587493948635;
	Tue, 21 Apr 2020 11:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
In-Reply-To: <20200421182754.GA49104@lobo>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 21 Apr 2020 21:32:17 +0300
Message-ID: <CALT56yMxxCFX_j=A9YKysPcuBWs2a0iJbCXuE2q1iqy3irOxdA@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LIWjO4028521
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Apr 2020 08:14:08 -0400
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

0LLRgiwgMjEg0LDQv9GALiAyMDIwINCzLiDQsiAyMToyNywgTWlrZSBTbml0emVyIDxzbml0emVy
QHJlZGhhdC5jb20+Ogo+Cj4gT24gTW9uLCBBcHIgMjAgMjAyMCBhdCAgOTo0NlAgLTA0MDAsCj4g
RG1pdHJ5IEJhcnlzaGtvdiA8ZGJhcnlzaGtvdkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9t
OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnlfYmFyeXNoa292QG1lbnRvci5jb20+Cj4gPgo+ID4g
QWxsb3cgb25lIHRvIHVzZSBlbmNyeXB0ZWQgaW4gYWRkaXRpb24gdG8gdXNlciBhbmQgbG9naW4g
a2V5IHR5cGVzIGZvcgo+ID4gZGV2aWNlIGVuY3J5cHRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5X2JhcnlzaGtvdkBtZW50b3IuY29tPgo+Cj4gSSBm
aXhlZCB1cCBzb21lIGlzc3VlcywgcGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIGluY3JlbWVudGFs
IHBhdGNoLAo+IEknbGwgZ2V0IHRoaXMgZm9sZGVkIGluIGFuZCBzdGFnZWQgZm9yIDUuOC4KClRo
YW5rIHlvdSEKCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==


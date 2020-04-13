Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D86651A73B6
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:30:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bgfjYD4fd0fydm4lO8X5VhehKzqU3LwCajxS+VHR6eo=;
	b=I0kFxwfIqA5hBscq+M16iOzN7kwEuMKeulMaBlYBDaJmvUMQHuifN4GiCJTpaGaAt6zL2P
	PyES9yPgtxO0oBnGuHS7bGb7yIMw9PP4ng2ix0oE8csMBqPmj1z1KKqaM2IT/Y/IiIxGCY
	jP26YOcK3OfMBQY9FQT0D/z1jRkSe2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-r9xUcfRCPFyHO-IMEhRzNA-1; Tue, 14 Apr 2020 02:29:47 -0400
X-MC-Unique: r9xUcfRCPFyHO-IMEhRzNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2F3801E66;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D25271A3;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9571E18089CD;
	Tue, 14 Apr 2020 06:29:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03D4VhEg008520 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Apr 2020 00:31:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 281EE10E60DF; Mon, 13 Apr 2020 04:31:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2395E10E60DE
	for <dm-devel@redhat.com>; Mon, 13 Apr 2020 04:31:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FB748007CB
	for <dm-devel@redhat.com>; Mon, 13 Apr 2020 04:31:40 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-ooMfy7gTPMuGnl4-71btTA-1; Mon, 13 Apr 2020 00:31:37 -0400
X-MC-Unique: ooMfy7gTPMuGnl4-71btTA-1
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20200413043134epoutp03c1807f04744529aa8e6505fc67fc11b4~FRs4T_YJl0985409854epoutp03c
	for <dm-devel@redhat.com>; Mon, 13 Apr 2020 04:31:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20200413043134epoutp03c1807f04744529aa8e6505fc67fc11b4~FRs4T_YJl0985409854epoutp03c
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20200413043133epcas1p30dab5615302e7d65d8358ae762cf56f0~FRs3tUAhI1933219332epcas1p3L;
	Mon, 13 Apr 2020 04:31:33 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.160]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 490wg86TzTzMqYmB;
	Mon, 13 Apr 2020 04:31:32 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.2D.04402.42BE39E5; Mon, 13 Apr 2020 13:31:32 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20200413043132epcas1p10720f5787ba23504a9574312aa9471d0~FRs2aXH3j1616416164epcas1p1Z;
	Mon, 13 Apr 2020 04:31:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200413043132epsmtrp249552862c07feb25dc9f27e8bf2b6836~FRs2ZgywF2658726587epsmtrp20;
	Mon, 13 Apr 2020 04:31:32 +0000 (GMT)
X-AuditID: b6c32a35-76bff70000001132-90-5e93eb24a715
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.4F.04024.42BE39E5; Mon, 13 Apr 2020 13:31:32 +0900 (KST)
Received: from [10.253.105.163] (unknown [10.253.105.163]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20200413043132epsmtip13444828e122a536e370c847bd728c70f~FRs2N-sE_0702307023epsmtip1p;
	Mon, 13 Apr 2020 04:31:32 +0000 (GMT)
To: Sami Tolvanen <samitolvanen@google.com>
From: Sunwook Eom <speed.eom@samsung.com>
Message-ID: <8a6d104e-4a2b-c393-567f-95bc06f6763a@samsung.com>
Date: Mon, 13 Apr 2020 13:31:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABCJKueSJ4sXHL5xnB5LQVW_6od2+_TEp0y_vv1gdi=yBB1Zfg@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMJsWRmVeSWpSXmKPExsWy7bCmrq7K68lxBgtumFisP3WM2WLvu9ms
	Fpd3zWGz6GqMt1i64i2rRdvGr4wW/fs3sDmwe+ycdZfdY8GmUo/3+66yefRtWcXo8XmTXABr
	VI5NRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtARSgpl
	iTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCQ4MCveLE3OLSvHS95PxcK0MDAyNToMqE
	nIyT+ztZCiZyVczr3cXcwNjO0cXIySEhYCJx6c1m9i5GLg4hgR2MEk9ObmeGcD4xSrRM3M4G
	4XxjlJgzsY+li5EDrGX1Mh+I+F5GiRcHf0EVvWeUWNjUxQgyV1ggQKL5/xkmEFtEQFvi5tU+
	sLHMAm8ZJZZ/bmAGSbAJaEoc6jnGAmLzCthJfHk0iQ3EZhFQlbjc3gQWFxWIkLi39CAzRI2g
	xMmZT8Cu4BQIlLj2JQokzCwgL9G8dTYzhC0ucevJfCaQXRICj9kkVt5cxALxqIvE4k+zoWxh
	iVfHt7BD2FISn9/tZYOwqyWunLjIBGHXSPRev8UKYRtL9PZcYAbZywx08/pd+hBhRYmdv+cy
	Quzlk3j3tYcVEkC8Eh1tQhAlyhJvj5+H2iopcfrvVKiJHhJfFm5mn8CoOAvJY7OQfDMLyTez
	EBYvYGRZxSiWWlCcm55abFhgiBzZmxjBCVTLdAfjlHM+hxgFOBiVeHgTXCbHCbEmlhVX5h5i
	lOBgVhLhfVI+MU6INyWxsiq1KD++qDQntfgQoykw3CcyS4km5wOTe15JvKGpkbGxsYWJmbmZ
	qbGSOO/U6zlxQgLpiSWp2ampBalFMH1MHJxSDYwl545ECO9axd+o7O2zsORBgWDZNIuPLtuO
	SRmE7+mdd2Hf/jCeG7pn83L1eBo+bHnXZL1L3+n4s2AD09+HX9t9mFbP/Xd6QsrR2ruz7ips
	aX/iN6Vow6lHL47JOn4WCNx06oyZ7+u9QnsnfP7CI9j0etHH+pLQh/sVgv+n7JRTk2RNYtFe
	ce+VEktxRqKhFnNRcSIAJ9kWm7YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnK7K68lxBkceyVisP3WM2WLvu9ms
	Fpd3zWGz6GqMt1i64i2rRdvGr4wW/fs3sDmwe+ycdZfdY8GmUo/3+66yefRtWcXo8XmTXABr
	FJdNSmpOZllqkb5dAlfGyf2dLAUTuSrm9e5ibmBs5+hi5OCQEDCRWL3Mp4uRi0NIYDejxIHp
	W5m7GDmB4pISb5ouM0LUCEscPlwMUfOWUaLv4zz2LkZ2DmEBP4lP/iDVIgLaEjev9jGDlDCD
	lBx98ooZov4mo8SXTxuZQKrYBDQlDvUcYwGxeQXsJL48msQGYrMIqEpcbm8Ci4sKREi03r3F
	DFEjKHFy5hMWkBs4BQIlrn2JAgkzC5hJzNv8kBnClpdo3jobyhaXuPVkPtMERqFZSLpnIWmZ
	haRlFpKWBYwsqxglUwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgqNFS3MH4+Ul8YcYBTgY
	lXh4d7hNjhNiTSwrrsw9xCjBwawkwvukfGKcEG9KYmVValF+fFFpTmrxIUZpDhYlcd6necci
	hQTSE0tSs1NTC1KLYLJMHJxSDYzd4SvMXbrPyn5Tn55cumPhDfkJwgzTzxx5sul+2+pVIS92
	7S2Pi69ZxaYq9o5tgfW5zWs/bV3lXzHzsGfH5im9fJksAutubd83YebMiyfX3S3YJ6Ql/kz2
	c01C3aUeW8n2vVlLigo72i/Uqp+dtvF9a/XMoh8FCzUS9LhbTt7QmnGqbdq5v0r/lViKMxIN
	tZiLihMBOBGpm5ICAAA=
X-CMS-MailID: 20200413043132epcas1p10720f5787ba23504a9574312aa9471d0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269
References: <CGME20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269@epcas1p2.samsung.com>
	<b8de2c4b-d8cf-2bdb-f4cf-5b10faf48955@samsung.com>
	<CABCJKueSJ4sXHL5xnB5LQVW_6od2+_TEp0y_vv1gdi=yBB1Zfg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03D4VhEg008520
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:26 -0400
Cc: sunwook5492@gmail.com, Mike Snitzer <snitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?6rCV66y47LKg?= <mcneo.kang@samsung.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm verity fec: fix hash block number in
 verity_fec_decode
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Ck9uIDIwLiA0LiAxMS4g7Jik7KCEIDEyOjQxLCBTYW1pIFRvbHZhbmVuIHdyb3RlOgo+IE9uIFRo
dSwgQXByIDksIDIwMjAgYXQgODo1NCBQTSBTdW53b29rIEVvbSA8c3BlZWQuZW9tQHNhbXN1bmcu
Y29tPiB3cm90ZToKPj4gVGhlIGVycm9yIGNvcnJlY3Rpb24gZGF0YSBpcyBjb21wdXRlZCBhcyBp
ZiBkYXRhIGFuZCBoYXNoIGJsb2Nrcwo+PiB3ZXJlIGNvbmNhdGVuYXRlZC4gQnV0IGhhc2ggYmxv
Y2sgbnVtYmVyIGlzIHN0YXJ0IGZyb20gdi0+aGFzaF9zdGFydC4KPj4gU28sIHdlIGhhdmUgdG8g
Y2FsY3VsYXRlIGhhc2ggYmxvY2sgbnVtYmVyIGJhc2VkIG9uIHRoYXQuCj4+Cj4+IEZpeGVzOiBh
NzM5ZmYzZjU0M2FmICgiZG0gdmVyaXR5OiBhZGQgc3VwcG9ydCBmb3IgZm9yd2FyZCBlcnJvciBj
b3JyZWN0aW9uIikKPj4gU2lnbmVkLW9mZi1ieTogU3Vud29vayBFb20gPHNwZWVkLmVvbUBzYW1z
dW5nLmNvbT4KPj4gLS0tCj4+ICAgIGRyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5jIHwgMiArLQo+
PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5jIGIvZHJpdmVycy9tZC9kbS12
ZXJpdHktZmVjLmMKPj4gaW5kZXggNDkxNDdlNjM0MDQ2Li5mYjQxYjRmMjNjNDggMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvZG0t
dmVyaXR5LWZlYy5jCj4+IEBAIC00MzUsNyArNDM1LDcgQEAgaW50IHZlcml0eV9mZWNfZGVjb2Rl
KHN0cnVjdCBkbV92ZXJpdHkgKnYsIHN0cnVjdAo+PiBkbV92ZXJpdHlfaW8gKmlvLAo+PiAgICAg
ICAgZmlvLT5sZXZlbCsrOwo+Pgo+PiAgICAgICAgaWYgKHR5cGUgPT0gRE1fVkVSSVRZX0JMT0NL
X1RZUEVfTUVUQURBVEEpCj4+IC0gICAgICAgIGJsb2NrICs9IHYtPmRhdGFfYmxvY2tzOwo+PiAr
ICAgICAgICBibG9jayA9IGJsb2NrIC0gdi0+aGFzaF9zdGFydCArIHYtPmRhdGFfYmxvY2tzOwo+
Pgo+PiAgICAgICAgLyoKPj4gICAgICAgICAqIEZvciBSUyhNLCBOKSwgdGhlIGNvbnRpbnVvdXMg
RkVDIGRhdGEgaXMgZGl2aWRlZCBpbnRvIGJsb2NrcyBvZiBOCj4gVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2ghCj4KPiBSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2ds
ZS5jb20+Cj4KPiBTYW1pCj4KPgpBZGQgQ0MgOiBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0
dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==


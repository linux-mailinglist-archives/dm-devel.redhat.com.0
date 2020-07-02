Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ABB07212652
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 16:32:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-BGqFpLohNWu7j7qc8r-7Kw-1; Thu, 02 Jul 2020 10:32:02 -0400
X-MC-Unique: BGqFpLohNWu7j7qc8r-7Kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69FF910059A5;
	Thu,  2 Jul 2020 14:31:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5AED7610C;
	Thu,  2 Jul 2020 14:31:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE6096C9C6;
	Thu,  2 Jul 2020 14:31:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062EVQZF009937 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 10:31:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBCE91160935; Thu,  2 Jul 2020 14:31:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B22EC116CCF9
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 14:31:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8355980027E
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 14:31:24 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-468-8bUSna0vMSW6iGbxiWhSDA-1;
	Thu, 02 Jul 2020 10:31:22 -0400
X-MC-Unique: 8bUSna0vMSW6iGbxiWhSDA-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-5-PCJSeS4iPhCZXj0jAKw-ng-1; Thu, 02 Jul 2020 16:31:19 +0200
X-MC-Unique: PCJSeS4iPhCZXj0jAKw-ng-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0401MB2517.eurprd04.prod.outlook.com (2603:10a6:4:34::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23;
	Thu, 2 Jul 2020 14:31:18 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.035;
	Thu, 2 Jul 2020 14:31:17 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/4] libmultipath: fix sysfs dev_loss_tmo parsing
Thread-Index: AQHWT/iI3BbhYH3wYUyKb9PS/jTy56j0WvIA
Date: Thu, 2 Jul 2020 14:31:17 +0000
Message-ID: <808a0a681be20a1d1cfe616bc5a370db7fda2ce9.camel@suse.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
	<1593643176-6206-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6828f199-7b9f-41fe-c860-08d81e949531
x-ms-traffictypediagnostic: DB6PR0401MB2517:
x-microsoft-antispam-prvs: <DB6PR0401MB251786ACF3B6EAD9F63F10AEFC6D0@DB6PR0401MB2517.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ce7kOiquMpGJhqGIPqSrbTPpqPZXaq4aPs37MJHLqwfR52ip2EUG5r2bDChOVgOh/026KZcf76oDzvZ0zlKH1F8bPIkXSUm/zrQCRV3sHJwNz6zZzaLLvIXhVT/mczLIKE/y04+hvdX3QwvJvPJO9ZsyckyGyuYPUooIrZ5A3yl/Lv6NOH7DraeCDdnygGyIIthjIxgA62wxoIgEzKuz5fenxN+f6bYh9qGvnv8cYSzVxGLG9v/LHuc8LdEgy3fbjR2YJfOlObb8WvYZtbXpdgeChFILdNjn+lYqZc19BVjwc2wAOClsDKMRxsL/unS79v+fgsJW8pkiXv08EC7T4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(376002)(366004)(39860400002)(136003)(346002)(8936002)(71200400001)(83380400001)(6486002)(316002)(64756008)(6512007)(2616005)(110136005)(86362001)(66556008)(66476007)(66946007)(91956017)(76116006)(36756003)(478600001)(66446008)(53546011)(6506007)(8676002)(186003)(26005)(4326008)(5660300002)(2906002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: CWWFkcpyTOMhXMEcikDbxzRRNDrenL9/BisU1H5oH8odRLijEfelg8s/XzEcIu8UvjhzftE1Uqxs9hFgqHpXwt2RfIMhiPkdUdji4wSUAiQJCs/ktiXqv46cdqF81xaUqSskYVEO8Eng4ZhJCgVJUUMD5U0kXkhIwINQzJYzS+bLWpf/lS5hQRnMbFKB00Kl/RpfJzmKHPAhxlILy3/QxXsOwEjCsa7686Dg/LL6Z0P0uksxabZqKvp15RdmwpJU4VUGmUYFHhislv32VmJepaEa8MaTJD3X7VLFQZBcWmuCBDu+hh7aWoRiudw5eO1JE56h+JzW66gLUvHzAOC6bfQvnXdkvC6YvyZtmX7qNfWMRUaGI+mKUPke3Gcf9EVpAGeWlycKY7KiXZVE1EZcKpR8xHFCTWaMaK0IUhQt+sSUZOLKt2ePqQmHtmOG80jRDwQchjcjPz3dskaZ6Jxm0zWPOf6c5rTRW9dBw69bHOWU0Y4Bf5wFsD4IKSOw8dhB
x-ms-exchange-transport-forked: True
Content-ID: <F7CF0B1F88E84649B36891F792332436@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6828f199-7b9f-41fe-c860-08d81e949531
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 14:31:17.8157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIomDIQj4zDMM5ouQa7wUjltg6p7j9hDmbFS6fWU0QWjY1Ff55aN8Ghz2ZYtdP7XvXLlOZD74Uawq6rT7NdJSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2517
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 062EVQZF009937
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] libmultipath: fix sysfs dev_loss_tmo
	parsing
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 17:39 -0500, Benjamin Marzinski wrote:
> dev_loss_tmo is a u32 value. However the kernel sysfs code prints it
> as
> a signed integer. This means that if dev_loss_tmo is above INT_MAX,
> the
> sysfs value will be a negative number. Parsing this was causing
> sysfs_set_rport_tmo() to fail.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Thanks for catching this. I think it can be fixed simpler, because 
strtoul() parses negative values just fine. See below.

Regards,
Martin

>From 16eca9b0f340a13fee0c28ae52dffa578193f015 Mon Sep 17 00:00:00 2001
From: Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 1 Jul 2020 17:39:33 -0500
Subject: [PATCH] libmultipath: fix sysfs dev_loss_tmo parsing

dev_loss_tmo is a u32 value. However the kernel sysfs code prints it as
a signed integer. This means that if dev_loss_tmo is above INT_MAX, the
sysfs value will be a negative number. Parsing this was causing
sysfs_set_rport_tmo() to fail.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 1d542ea..3c9803a 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -581,7 +581,7 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 	struct udev_device *rport_dev = NULL;
 	char value[16], *eptr;
 	char rport_id[32];
-	unsigned long long tmo = 0;
+	unsigned int tmo;
 	int ret;
 
 	sprintf(rport_id, "rport-%d:%d-%d",
@@ -605,8 +605,8 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 			"error %d", rport_id, -ret);
 		goto out;
 	}
-	tmo = strtoull(value, &eptr, 0);
-	if (value == eptr || tmo == ULLONG_MAX) {
+	tmo = strtoul(value, &eptr, 0);
+	if (value == eptr) {
 		condlog(0, "%s: Cannot parse dev_loss_tmo "
 			"attribute '%s'", rport_id, value);
 		goto out;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


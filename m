Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D4C47EB
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 08:49:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 260A9308212F;
	Wed,  2 Oct 2019 06:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BAF11001B11;
	Wed,  2 Oct 2019 06:49:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D25E84A486;
	Wed,  2 Oct 2019 06:49:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x926mvAs014110 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 02:48:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA3DE60C80; Wed,  2 Oct 2019 06:48:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 862CC60BE0;
	Wed,  2 Oct 2019 06:48:55 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FEFB81F2F;
	Wed,  2 Oct 2019 06:48:52 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Wed,  2 Oct 2019 06:48:14 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 2 Oct 2019 06:48:11 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 2 Oct 2019 06:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=A5aKUrQvQi2at3F/3V4x9n8iCayNA21qBMfOnJnUd8tbaXeTP5SVyECtKKn4oOaq0FnZ9y0sHonLJ9FYLZ0rugCXX+ZstyeS9wVdGqX00aW2F6HrfcRQ4HlvUs/gTKRbw7Avql79PvMMjF9XV06g1Irwg5iYwiaTtkI5VkFuciZgziW3aL4ECkaEB+UJMkTzQHfFcK7cZFnu1gH9ocmHiMaK9BDehFGZT4f53Xw4WVhXYPJUmo/sZxeX3yOgIvB2HblR/kfo0OMDVtdmql7U3/QLE2UzkcXlb5gD3c65yvqtv2KxVlOLylNtzehd084eCptYb9LYPoGgsAsRqDD21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yt2Gf7UBf3sqkg2wIyc+dT/6kV4OK7pTk9O19LNm+yI=;
	b=GFnY8J5xArcNy4TFmcXYyvBia/c2I6klUTgAI1TpgdTnNoN7Mn0UECNR6Tq/mhKamhfZAXYj+/BAIlquZ3z80vBAzr1g5D/EHuYzM5zOlzAa2miJWsPbbDgY7jaVv3o8CrSdMzVlEZbeVp6+3lu62QeB0jch3rhsz+Zj60yNAH5Jn6Qtrx33Gol7CcCw0LC121vBkDtQWP784SfgJW8hXJi+p2CNYvRD5Zi0WULPW7s/SB/VcgiuJyMDplAndc2B8KaGbmkSMUCqtWXqE2FGHeAJZ6xBQ1yxUCLKKSFOOXNxBipB+WgXhfZrE9RaAlwm12mZW20TE0SGUnVu1Lx34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3176.namprd18.prod.outlook.com (52.132.244.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Wed, 2 Oct 2019 06:48:07 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.017;
	Wed, 2 Oct 2019 06:48:07 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Chongyun Wu
	<wu.chongyun@h3c.com>
Thread-Topic: [PATCH 3/3] multipathd: "san_path_err" failure optimization
Thread-Index: AQHVeO1ZwcvVR+l4REWQI6mR31VCxA==
Date: Wed, 2 Oct 2019 06:48:07 +0000
Message-ID: <20191002064655.2669-4-martin.wilck@suse.com>
References: <20191002064655.2669-1-martin.wilck@suse.com>
In-Reply-To: <20191002064655.2669-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0111.eurprd07.prod.outlook.com
	(2603:10a6:207:7::21) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2edc0c3-9444-49f9-0c83-08d747047b62
x-ms-traffictypediagnostic: CH2PR18MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB3176C4D129C4BD4ADF7C25AAFC9C0@CH2PR18MB3176.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6506007)(110136005)(25786009)(5660300002)(66066001)(2906002)(316002)(102836004)(478600001)(76176011)(14454004)(52116002)(26005)(4326008)(99286004)(6486002)(186003)(81166006)(81156014)(8936002)(50226002)(6116002)(6512007)(54906003)(66446008)(64756008)(66946007)(256004)(386003)(3846002)(107886003)(44832011)(8676002)(2616005)(66556008)(6436002)(66476007)(476003)(71200400001)(1076003)(86362001)(71190400001)(36756003)(486006)(446003)(11346002)(305945005)(7736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3176;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xbTjQVBvo9xgeRiOL8V0Wz2pUDo2XbWdZCq/4C7/mtbzL53Z77hTIyS/N80hNQi9tjU+iB6bO1MxOHXOVlL3WMs0MEP5/oa3/W2K/cihJjO+ltKiP4UL3DzxuOtHoGbk6dPxf/ZE9QPkkUcXA8GLsFqlZ19o+VUKGbIk63p9xvwuqFnO9FwgkEhWLWKBm2XCh0s6bNFWnBy+e8C/PH/sxWTVOjADrx5q3ewgW+HJ7q9+lHaZLoLQ68Nm3Zutcg1Xf16KP/KVr6AKw6sNLYB0ii653SUplQwmhBT2SMPzbDvpb84vI5XC7EoWqH7ruRgWwqaAOavBn3n6Gt5H3aGgq8qf0seJCMoxJAOUGj0i9fSNUecFjI2StjG8QQUiVuudjtW/wPXejoIS6kYFz1sGfN91w4JE6e+i6ENeQRFyJAY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2edc0c3-9444-49f9-0c83-08d747047b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 06:48:07.3917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IjOanR7xzxSSRO/GTeyWUm8P0mp3p1ff+MhQakbUQ4bRze4kA/MSW93muu6TuG1Nkom6n5oduVNsIwKGVomYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3176
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Wed, 02 Oct 2019 06:48:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 02 Oct 2019 06:48:54 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x926mvAs014110
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/3] multipathd: "san_path_err" failure
	optimization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 02 Oct 2019 06:49:15 +0000 (UTC)

From: Chongyun Wu <wu.chongyun@h3c.com>

Let san_path_err_recovery_time path unstable can be
detected and not reinstate it until this path keep up in
san_path_err_recovery_time. It will fix heavy IO delay
caused by parts of paths state shaky in multipath device.

Test and result:
Run up eth1 30s and down eth1 30s with 100 loops script to
make some paths shaky in each multipath devices.
Using below multipath.conf configure in defaults section:
    san_path_err_recovery_time 30
    san_path_err_threshold 2
    san_path_err_forget_rate 6
After test, not found any IO delay logs except several logs in the very
beginning which before san_path_err filter shaky path works .
If without above config and this patch there will be lots of IO delay
in syslog and some paths state change from up to down again and again.

Signed-off-by: Chongyun Wu <wu.chongyun@h3c.com>
---
 multipathd/main.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 70172d71..34a57689 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1896,6 +1896,18 @@ static int check_path_reinstate_state(struct path * pp) {
 			goto reinstate_path;
 		}
 		get_monotonic_time(&curr_time);
+
+		/* If path became failed again or continue failed, should reset
+		 * path san_path_err_forget_rate and path dis_reinstate_time to
+		 * start a new stable check. 
+		 */
+		if ((pp->state != PATH_UP) && (pp->state != PATH_GHOST) &&
+			(pp->state != PATH_DELAYED)) {
+			pp->san_path_err_forget_rate =
+				pp->mpp->san_path_err_forget_rate;
+			pp->dis_reinstate_time = curr_time.tv_sec;
+		}
+
 		if ((curr_time.tv_sec - pp->dis_reinstate_time ) > pp->mpp->san_path_err_recovery_time) {
 			condlog(2,"%s : reinstate the path after err recovery time", pp->dev);
 			goto reinstate_path;
@@ -2066,6 +2078,11 @@ check_path (struct vectors * vecs, struct path * pp, int ticks)
 		pathinfo(pp, conf, 0);
 		pthread_cleanup_pop(1);
 		return 1;
+	} else if ((newstate != PATH_UP && newstate != PATH_GHOST) &&
+			(pp->state == PATH_DELAYED)) {
+		/* If path state become failed again cancel path delay state */
+		pp->state = newstate;
+		return 1;
 	}
 	if (!pp->mpp) {
 		if (!strlen(pp->wwid) &&
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
